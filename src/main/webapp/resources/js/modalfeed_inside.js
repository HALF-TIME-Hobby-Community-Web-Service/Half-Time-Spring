$(()=>{

	const feed_box_click = $('.feedbox')
	const feed_modalWrap = $('.feed_modalWrap')
	const feed_closeBtn = $('.feed_closeBtn')
	
	feed_box_click.click((e)=>{
	    feed_modalWrap.css('display','block')
	})
	
	feed_closeBtn.click(()=>{
	    feed_modalWrap.css('display','none')
	})

  	
})

/*js가 실행이 안된다
모달창은 문제없다 > 클릭하면 뜨지 않는다 (문제점) */