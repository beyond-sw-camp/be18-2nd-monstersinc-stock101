package com.monstersinc.stock101.restclient.stock.model.service;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.monstersinc.stock101.restclient.stock.model.NewsPolygonResponse;
import com.monstersinc.stock101.restclient.stock.model.PolygonResponse;
import com.monstersinc.stock101.restclient.stock.model.dto.GetNewsDto;
import com.monstersinc.stock101.restclient.stock.model.dto.GetStockCodeDto;
import com.monstersinc.stock101.restclient.stock.model.dto.StockFinancialInfoResDto;
import com.monstersinc.stock101.restclient.stock.model.dto.StockPriceDto;
import com.monstersinc.stock101.restclient.stock.model.mapper.StockRestClientMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StockRestClientServiceImpl implements StockRestClientService {

    //application.yml에서 가져오기
    @Value("${apikey.stock-key}")
    private String stockKey;

    private final ObjectMapper objectMapper;

    private StockFinancialInfoResDto stockInfoResDto;

    private final RestTemplate restTemplate;
    private final StockRestClientMapper stockRestClientMapper;

    // @Override
    // public Object getStockInfo(String stockCode) {
    //     RestTemplateBuilder builder = new RestTemplateBuilder();
    //     RestTemplate restTemplate = builder.build();
    //     String url = "https://api.polygon.io/vX/last/stocks/" + stockCode + "?apikey=" + stockKey;


    // }
    @Override
    public String getnews(){
        try{
            List<GetStockCodeDto> allStockCodes = getAllStockCodes();
            for(GetStockCodeDto getStockCodeDto : allStockCodes) {
                    String ticker = getStockCodeDto.getStockCode();
            String url = "https://api.polygon.io/v2/reference/news?ticker="+ticker+"limit=10&sort=published_utc&order=desc&apikey=" + stockKey;
             NewsPolygonResponse np = restTemplate.getForObject(url, NewsPolygonResponse.class);

            if(np == null || np.getResults() == null || np.getResults().isEmpty()) {
                System.out.println("No news data for ticker: "+ticker);
                break;
            }

            //newsPolygonResponse을 가공 후 dto로 변환
            for(int i=0; i<np.getResults().size(); i++){
            List<String> Tickers = np.getResults().get(i).getTickers();
             // 뉴스 데이터가 없을 경우 처리
            if(!Tickers.getFirst().equals(ticker)) {
                System.out.println("No news data for ticker: "+ticker);
                continue;
            }
            GetNewsDto getNewsDto = GetNewsDto.builder()
            .newsId(np.getResults().get(i).getId())   
            .title(np.getResults().get(i).getTitle())
            .contentSummary(np.getResults().get(i).getDescription())
            .articleUrl(np.getResults().get(i).getArticleUrl())
            .publishedAt(np.getResults().get(i).getPublishedUtc())
            .build();
             // 뉴스 데이터가 없을 경우 처리    
            if(getNewsDto == null) {
                System.out.println("No news data for ticker: "+ticker);
                break;
            }
            //중복 뉴스 방지
            if(stockRestClientMapper.existsNews(getNewsDto.getNewsId())) {
                System.out.println("News already exists for ticker: "+ticker);
                continue;
            }
            // mapper는 인스턴스(stockRestClientMapper)에서 호출해야 합니다.
            stockRestClientMapper.insertNews(getNewsDto);
            System.out.println("News updated for ticker: "+ticker);
            Thread.sleep(15000); // 15초 대기
            }
            return "News updated successfully.";
            }
        }catch (Exception e) {
                throw new RuntimeException(e);
            }
        return "News updated successfully.";
    }

    //주식 가격 가져오기
    @Override
    public String getStockprices() { 
        try{
            List<GetStockCodeDto> allStockCodes = getAllStockCodes();
            for(GetStockCodeDto getStockCodeDto : allStockCodes) {
                    Long id = getStockCodeDto.getStockId();
                    String ticker = getStockCodeDto.getStockCode();
            RestTemplateBuilder builder = new RestTemplateBuilder();
            RestTemplate restTemplate = builder.build();

            LocalDate date = LocalDate.now().minusDays(2);

            // 주말이면 금요일로 보정
            if (date.getDayOfWeek() == DayOfWeek.SATURDAY) {
                date = date.minusDays(1);
            } else if (date.getDayOfWeek() == DayOfWeek.SUNDAY) {
                date = date.minusDays(2);
            }

            String searchDate = date.toString(); // yyyy-MM-dd

            String url =  "https://api.polygon.io/v1/open-close/" 
                            + ticker + "/"
                            + searchDate // 무료 플랜은 하루 전 데이터만 제공
                            // + LocalDate.now().toString()  --- IGNORE
                            + "?adjusted=true&apiKey=" + stockKey;

            String body = restTemplate.getForObject(url, String.class);
            if(body == null || body.contains("\"status\":\"NOT_FOUND\"")) {
                System.out.println("No price data for ticker: "+ticker);
                break;
            }
            StockPriceDto StockPriceDto = objectMapper.readValue(body, StockPriceDto.class);

            double lastClosePrice = stockRestClientMapper.getStockPriceById(id);

            double fluctuation = decimal_round(StockPriceDto.getClose() - (lastClosePrice == 0 ? 0 : lastClosePrice));
            
            StockPriceDto.setId(id);
            StockPriceDto.setFluctuation(fluctuation);
            StockPriceDto.setPK(ticker+"_"+searchDate); // PK 설정
            // mapper는 인스턴스(stockRestClientMapper)에서 호출해야 합니다.
            stockRestClientMapper.updateStockInfo(StockPriceDto); //stocks 테이블 업데이트
            stockRestClientMapper.insertStockPrice(StockPriceDto); //stock_prices 테이블에 가격 이력 추가
            System.out.println("Get Stock Price (ticker: "+ticker+")");

            Thread.sleep(15000); // polygon.io free 정책 분당 5회 제한으로 인한 15초 대기
            }
        }catch (Exception e) {
                throw new RuntimeException(e);
            }
            return "Stock prices updated successfully.";
    }
    //재무제표 가져오기

    // 진짜 머리뽑으면서 짠 코드 
    @Override
    public String getFinancialInfo(String timeframe) {
            try{
                List<GetStockCodeDto> allStockCodes = getAllStockCodes();
                for(GetStockCodeDto getStockCodeDto : allStockCodes) {
                    Long id = getStockCodeDto.getStockId();
                    String ticker = getStockCodeDto.getStockCode();

                
                String url = "https://api.polygon.io/vX/reference/financials"
                    + "?ticker=" + ticker
                    + "&timeframe=" + timeframe 
                    + "&limit=4"
                    + "&apikey=" + stockKey;

                String body = restTemplate.getForObject(url, String.class);
                PolygonResponse pr = objectMapper.readValue(body, PolygonResponse.class);

                if (!(pr.getResults() == null || pr.getResults().size() < 2)) {

                var r0 = pr.getResults().get(0);
                var r1 = pr.getResults().get(1);

                var bs0 = r0.getFinancials().getBalanceSheet();
                var bs1 = r1.getFinancials().getBalanceSheet();
                var is0 = r0.getFinancials().getIncomeStatement();

                double eq0 = nz(bs0.getEquityAttributableToParent().getValue());
                double eq1 = nz(bs1.getEquityAttributableToParent().getValue());
                double assets0 = nz(bs0.getAssets().getValue());
                double assets1 = nz(bs1.getAssets().getValue());

                double netIncome = nz(is0.getNetIncomeLoss().getValue());
                double epsBasic  = nz(is0.getBasicEps().getValue());
                double shares    = nz(is0.getBasicAverageShares().getValue());

                double avgEq = (eq0 + eq1) / 2.0;
                double avgAssets = (assets0 + assets1) / 2.0;

                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate ed = LocalDate.parse(r0.getEndDate(), dtf);
                int qt = (ed.getMonthValue()-1)/3 + 1;

                Double roe = (avgEq == 0) ? null : netIncome / avgEq;
                Double roa = (avgAssets == 0) ? null : netIncome / avgAssets;
                Double bps = (shares == 0) ? null : eq0 / shares;
                
                StockFinancialInfoResDto stockInfoResDtoLocal = StockFinancialInfoResDto.builder()
                    .ticker(ticker)
                    .stockId(id)
                    .timeframe(timeframe)
                    .periodEnd(r0.getEndDate())
                    .quarter(qt)
                    .roe(decimal_round(roe))
                    .roa(decimal_round(roa))
                    .eps(decimal_round(Double.isFinite(epsBasic) ? epsBasic : null))
                    .bps(decimal_round(bps))
                    .build();
                if (!stockRestClientMapper.existsFinance(id)) {
                    stockRestClientMapper.insertFinance(stockInfoResDtoLocal);
                } else {
                    stockRestClientMapper.updateFinance(stockInfoResDtoLocal);
                }
                this.stockInfoResDto = stockInfoResDtoLocal;
                System.out.println("Get Stock Finance (ticker: "+ticker+")");
                Thread.sleep(15000); // polygon.io free 정책 분당 5회 제한으로 인한 15초 대기
                }
            }
            }catch (Exception e) {
                throw new RuntimeException(e);
            }
            return "Financial info updated successfully.";
        }

    public List<GetStockCodeDto> getAllStockCodes() {
        return stockRestClientMapper.getAllStockCodes();
    }
    private double nz(Double val) {
        return (val == null) ? 0.0 : val;
    }
    private double decimal_round(double val) {
        return val = Math.round(val*1000)/1000.0;
    }
}       