$(() => {
    
    const memberClose = $('.member_closeBtn')
    const memberList = $('.member_modalWrap')
    const memberListClick = $('.memberList')


    memberClose.click(() => {
        memberList.css('display', 'none')
    })


    memberListClick.click((e)=>{        
        memberList.css('display','block')
    })
})