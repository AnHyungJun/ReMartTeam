<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp63973504');  // 가맹점 식별 코드

IMP.request_pay({
   	pg : 'nice', // 결제방식
    pay_method : '${pay_method }',	// 결제 수단
    merchant_uid : 'remart_' + new Date().getTime(),
   	name : '${pro_name} 외${count-1}개',	// order 테이블에 들어갈 주문명 혹은 주문 번호
    amount : '${all_price }',	// 결제 금액
  	buyer_name :  '${name }',	// 구매자 이름
    buyer_tel :  '${phone }',	// 구매자 전화번호
    buyer_addr :  '${address1 }' + '${address2 }',	// 구매자 주소
    buyer_postcode :  '${zip1 }' +'${zip2 }'	// 구매자 우편번호
   
}, function(rsp) {
	if ( rsp.success ) { // 성공시
		var msg = '결제가 완료되었습니다.';
		window.location.href="orderFinish";
	} else { // 실패시
		var msg = '결제에 실패하였습니다.';
		msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);
});

</script>
