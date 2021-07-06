function search(keyword) {
    console.log('search ' + keyword);
}

function renderSuggest(suggester, options) {
    var box = $(suggester);
    if (options.length < 1) {
        box.hide();
        return;
    }
    box.show();
    box.html('');
    options.forEach(element => {
        console.log(element);
        box.append('<li class="ui-menu-item" onclick="search(`' + element + '`)"><div id="" tabindex="-1" class="ui-menu-item-wrapper">' + element + '</div></li>');
    });
}

function fetchAndRender(key,mode, suggester) {
    $.ajax({
        url: 'http://localhost:8080/suggest/check',
        data: {
            'key': key,
            'strmode': mode
        },
        success: function (rsp) {
            console.log(rsp);
            if (rsp && rsp.length > 0) {
                renderSuggest(suggester, rsp);
            } else {
                renderSuggest(suggester, []);
            }
        }
    });
}

$(document).ready(() => {
    var currentKw = '';
    var inputCls = 'input.custom-combobox-input';
    $(inputCls).keyup(() => {
        var newKw = $(inputCls).val();
        console.log(newKw);
        if (newKw === currentKw) {
            return;
        }
        currentKw = newKw;
        //fetch suggester
        //render suggester
        fetchAndRender(currentKw,'', "#suggester1");
        fetchAndRender(currentKw,'popular', "#suggester2");
        // fetchAndRender(currentKw,'always', "#suggester3");

      
    });
});