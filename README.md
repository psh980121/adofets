## 1. 프로젝트 소개

<div align="center">
Adofet은 1인 가구가 늘어 남에 따라 그에 따른 반려동물도 늘어나는 반면
그만큼 유기동물의 숫자도 늘어나는 현 상황에 조금이라도 도움이 되고,
반려동물 입양을 고려하고있는 분들을 위한 사이트 개발
</div>
<br>


## 1.1 프로젝트 명: Adofet


```jsx
📕  **유기동물 입양 기능** : 독서기록 서비스와 SNS가 결합된 서비스를 제공합니다.

📗  **애완용품 판매 기능** : 내용은 알고 있지만 책의 이름이 기억이 나지 않을 경우 유사한 단어를 추적해 책을 찾아줍니다.

📒  **애완동물 입양 후기 게시판 기능** : 찜을 통해 좋아하는 책을 담을수 있고, 원하는 게시물에 '좋아요'를 누르거나 댓글을 등록할 수 있습니다.

<br>

## 1.2 개발 환경

### ⚙️   사용기술 
| FrontEnd | BackEnd | Server | 협업방식 | DB |
| :----: | :----: | :----: | :----: |:----: |
| HTML CSS Bootstrap   | JAVA OPEN API KAKAO DEV 공공데이터포털 | Apach Tomcat |  Github | Oracle | 

## 2-1. 기능구현 및 역할 
박상현 - 입양 문의사항 및 페이징 
> 입양 문의사항 페이지를 담당하였으며 문의사항 전체 글을 페이징 하는 역할을 맡아 하였습니다.

## 2-2 화면 및 설명
![My Image](https://raw.githubusercontent.com/psh980121/portfolio/main/내문의내역.png)
>나의 문의 내역을 볼수있는 페이지 상태여부에 따라 전체, 처리중, 처리완료 등으로 나누어 클릭시 상태여부에 맞는 문의내용만을 보여줄수있습니다.

<details>
<summary>AssistantApi 작업 코드</summary>
<div markdown="1">

```java
// 나의 문의 내역을 볼수있는 페이지
    public Map<String, Object> sendMessage(String bookname, String bookdetail) {

            String bookDetailMessage = "\n\nBookdetail:\n" +
                    "Book Name: " + bookname + "\n" +
                    "bookdetail: " + bookdetail + "\n" +
                    "내가 너에게 준 bookname하고 bookdetail에서 준 정보로 단어로된 키워드 5개만 뽑아줘 그리고 공백 없이 키워드만 보여줘"
                    ;

            HttpHeaders headers = createHeaders();
            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("role", "user");
            requestBody.put("content", bookDetailMessage);

            String messageUrl = threadurl + "/" + lastThreadId + "/messages";
            String assistantRunUrl = threadurl + "/" + lastThreadId + "/runs";

            try {
                // 메시지 전송
                ResponseEntity<String> messageResponseEntity = restTemplate.exchange(messageUrl, HttpMethod.POST,
                        new HttpEntity<>(requestBody, headers), String.class);
                String messageResponseBody = messageResponseEntity.getBody();

                // Assistant 실행
                ResponseEntity<Map> responseEntity = restTemplate.postForEntity(assistantRunUrl,
                        new HttpEntity<>(Collections.singletonMap("assistant_id", assistantId), headers), Map.class);
                Map<String, String> responseBody = responseEntity.getBody();
                String runId = responseBody.get("id");
                System.out.println("Assistant run started successfully for thread ID: " + lastThreadId);
                System.out.println("Run ID: " + runId);

                return Map.of("status", "Success", "responseBody", messageResponseBody);
            } catch (HttpClientErrorException e) {
                return Map.of("status", "Error");
            } catch (Exception e) {
                log.error("Exception occurred: {}", e.getMessage());
                return Map.of("status", "Error");
            }
        }

 // 키워드 업데이트
    // @Scheduled(cron = "0 */2 * * * *")
    public void updateAssistKeywords() {
        if (!isServer) {
            // 서버 환경에서는 스케줄러를 동작시킵니다.
            int count = 0;
            List<OurBookDto> books = dao.assistnull();
            if (books.isEmpty()) {
                log.info("No books found with null assist keyword.");
                return;
            }

            for (OurBookDto book : books) {
                if (count >= 1) {
                    log.info("Reached the limit of 1 updates.");
                    break;
                }

                try {
                    sendMessage(book.getBookname(), book.getBookdetail());
                    Thread.sleep(10000);
                    OpenAIResponse response = getLastMessage();
                    if (response != null && response.getText() != null && !response.getText().isEmpty()) {
                        book.setAssistkeyword(response.getText());
                        dao.updateAssistKeyword(Collections.singletonList(book));
                        log.info("Updated assist keyword for book: {}", book.getBookname());
                        count++;
                    } else {
                        log.error("Failed to retrieve message from OpenAI.");
                    }
                } catch (Exception e) {
                    log.error("Exception occurred while updating assist keyword: {}", e.getMessage());
                }
            }
        } else {
            // 로컬 환경에서는 스케줄러를 비활성화합니다.
            log.info("Scheduler is disabled in local environment.");
            return;
        }
    }
```
</div>
</details>

![Example Image] (https://github.com/psh980121/portfolio/blob/main/%E1%84%86%E1%85%AE%E1%86%AB%E1%84%8B%E1%85%B4%E1%84%80%E1%85%A6%E1%84%89%E1%85%B5%E1%84%91%E1%85%A1%E1%86%AB.png)
>모든 사람이 올린 문의내용을 볼 수 있습니다.

![Exmaple Image] (https://github.com/psh980121/portfolio/blob/main/%E1%84%86%E1%85%AE%E1%86%AB%E1%84%8B%E1%85%B4%E1%84%89%E1%85%A1%E1%84%92%E1%85%A1%E1%86%BC.png)
> 1:1 문의사항 작성 문의 내용을 선택하여 제목과 글을 쓰고 파일 이미지를 업로드 할수있게 구현하였습니다.

![Exmaple Image] (https://github.com/psh980121/portfolio/blob/main/%E1%84%86%E1%85%AE%E1%86%AB%E1%84%8B%E1%85%B4%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A6%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%87%E1%85%A9.png)
> 내가 올린 문의 상세 정보를 확인할 수 있게 구현하였습니다.

