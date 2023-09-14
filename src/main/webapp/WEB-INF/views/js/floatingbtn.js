$(() => {
    const plus = $('.fab');
    const box = $('.float-box');

    $(plus).click(() => {
        box.toggle(0, () => {
            if (box.is(':visible')) {
                plus.css({
                    'transform': 'rotate(3600deg)',
                    'transition': 'transform 10s ease' 
                });
            } else {
                plus.css({
                    'transform': 'rotate(0)',
                    'transition': 'transform 0.5s ease' 
                });
            }
        });
    });
});
