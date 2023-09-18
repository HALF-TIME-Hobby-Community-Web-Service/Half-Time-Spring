var pageNum = 1;

$(document).ready(() => {
    const options = {
        root: null,
        rootMargin: '0px',
        threshold: 0.5
    };
    loadMoreContent();
    
    const observer = new IntersectionObserver((entries) => {
        loadMoreCallback();
    }, options);

    function loadMoreContent() {
        alert("pagenum"+pageNum);
        
        $.ajax({
            url: 'http://localhost:8888/moment/list',
            method: 'POST',
            data: "pageNum=" + pageNum,
            dataType: "json",
            success: function (data) {
                alert(data);
                console.log(data);
                const container = $('.feed_content');

                $.each(data, function (data, item) {
                    // ...
                });
                pageNum++;
            },
            error: function (jqXhr, status) {
                alert(`실패: ${status}\n오류명: ${jqXhr.status}`);
                console.error('Failed to fetch new content.');
            }
        });
    }

    function loadMoreCallback() {
        alert("Callback ajax");
        
        $.ajax({
            url: 'http://localhost:8888/moment/feed',
            method: 'POST',
            data: "pageNum=" + pageNum,
            dataType: "json",
            success: function (data) {
                alert(data);
                console.log(data);
                const container = $('.feed_content');

                $.each(data, function (data, item) {
                    // ...
                });
                pageNum++;
            },
            error: function (jqXhr, status) {
                alert(`실패: ${status}\n오류명: ${jqXhr.status}`);
                console.error('Failed to fetch new content.');
            }
        });
    }

    $('.feed_container_append').scroll(() => {
        // 스크롤 이벤트 발생 시 IntersectionObserver를 활성화하여 무한 스크롤 지원
        const observer = new IntersectionObserver(loadMoreCallback, { threshold: 0.2 });
        observer.observe($('.feed_container_append').get(0));
    });
});
