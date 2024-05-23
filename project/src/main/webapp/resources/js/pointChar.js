document.addEventListener("DOMContentLoaded", function() {
    // 페이지 로드 시 모달이 자동으로 열리지 않도록 설정
    document.getElementById('modal').style.display = 'none';

    // 모달 열기 버튼에 클릭 이벤트 핸들러 등록
    document.getElementById('openModal').onclick = function() {
        document.getElementById('modal').style.display = 'flex';
        resetForms();
    };

    // 다음 버튼에 클릭 이벤트 핸들러 등록
    document.getElementById('next').onclick = function() {
        document.getElementById('form1').style.display = 'none';
        document.getElementById('form2').style.display = 'block';
        document.getElementById('tab1').classList.remove('selected');
        document.getElementById('tab2').classList.add('selected');
    };

    // 뒤로 가기 버튼에 클릭 이벤트 핸들러 등록
    document.getElementById('back').onclick = function() {
        document.getElementById('form2').style.display = 'none';
        document.getElementById('form1').style.display = 'block';
        document.getElementById('tab2').classList.remove('selected');
        document.getElementById('tab1').classList.add('selected');
    };

    // 취소 버튼에 클릭 이벤트 핸들러 등록
    document.querySelectorAll('#cancel').forEach(btn => {
        btn.onclick = function() {
            document.getElementById('modal').style.display = 'none';
            resetForms(); // 취소 버튼을 누를 때 초기화
            document.querySelectorAll('input[type="radio"]').forEach(radio => {
                radio.checked = false;
            });
        }
    });

    

	
    // 폼 초기화 함수 호출
    resetForms();
});

function resetForms() {
    document.getElementById('form1').style.display = 'block';
    document.getElementById('form2').style.display = 'none';
    document.getElementById('tab1').classList.add('selected');
    document.getElementById('tab2').classList.remove('selected');

}
