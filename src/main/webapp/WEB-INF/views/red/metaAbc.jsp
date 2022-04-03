<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab3b0466fa883da1d7216010325a5bcc&libraries=services"></script>
<script type="text/javascript">
		$(function() {
			$('#contentText').on("propertychange change keyup paste input",
					function() {
			
						var content = $(this).val();
						$('#counter').val(200 - content.length);

						if (content.length > 200) {
							$(this).val($(this).val().substring(0, 200));
						}
					});

			$("#sample5_address1").on("click", function() {
				if ($(this).val().length == 0) {
					sample5_execDaumPostcode()
				}
			});
		});//document.ready 끝

		
	</script>

</head>
