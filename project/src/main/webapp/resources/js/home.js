let localPage = 0;
let localValue = 0;
const localWidth = 110; //수정

const localBackBtn = document.querySelector(".local-back");
const localNextBtn = document.querySelector(".local-next");
const localDivs = document.querySelector(".section-slide-items");

function localBack() {
    const maxLocalPages = window.innerWidth <= 1200 ? 12 : 9; // 화면 크기에 따라 다른 최대 페이지 수 설정
    if (localPage < maxLocalPages) {
        localBackBtn.removeAttribute('disabled');
        localValue -= localWidth;
        localDivs.style.transform = `translateX(${localValue}px)`;
        localPage += 1;
    }
    if (localPage === maxLocalPages) {
        localNextBtn.setAttribute('disabled', 'true');
    }
}

function localNext() {
    if (localPage > 0) {
        localNextBtn.removeAttribute('disabled');
        localValue += localWidth;
        localDivs.style.transform = `translateX(${localValue}px)`;
        localPage -= 1;
    }
    if (localPage == 0) {
        localBackBtn.setAttribute('disabled', 'true');
    }
}
// ------- //
// 루트 이름에 쓸 기능
function setRouteItemWidth(routeItemClass) {
    const routeNameWidth = document.querySelector(`.${routeItemClass} .route-name`).getBoundingClientRect().width;
    const cssWidth = 180 - routeNameWidth;
    document.documentElement.style.setProperty(`--${routeItemClass}-value`, `${cssWidth}px`);
}

setRouteItemWidth('route-item01');
setRouteItemWidth('route-item02');
setRouteItemWidth('route-item03');
setRouteItemWidth('route-item04');
// -------//
//section 2에 쓸 달력 코드
/* 현재 월 효과 입히기 */
var previousMonthBtn = null;

var now = new Date();
var month = now.getMonth() + 1;   

var monthClassName = "month-" + month;

var monthElement = document.querySelector("." + monthClassName);
if (monthElement) {
    monthElement.classList.add('clickEvent');
}
/* 클릭 월 효과 입히기*/
const months = document.querySelectorAll('.month');

months.forEach(month => {
    month.addEventListener('click', function() {
        months.forEach(m => m.classList.remove('clickEvent'));

        
        var monthId = this.id;
        this.classList.add('clickEvent');
        alert(monthId);
    });
});


function init() {  //초기 화면 상태
    localBackBtn.setAttribute('disabled', 'true');
    localBackBtn.addEventListener("click", localNext);
    localNextBtn.addEventListener("click", localBack);
}
init();


document.addEventListener('DOMContentLoaded', function () {
        const slideItems = document.querySelectorAll('.slide-item img');

        slideItems.forEach(item => {
            item.addEventListener('click', function () {
                document.querySelectorAll('.slide-item img.clicked').forEach(img => img.classList.remove('clicked'));
                this.classList.add('clicked');
            });
        });
        
        // Set the first image as clicked by default
        slideItems[0].classList.add('clicked');
    });