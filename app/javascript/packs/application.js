// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap'


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


$(document).ready(function () {
    //分类筛选
    $(".category-item ").click(function () {
        var ele = $(this).text();
        $.post('/search',
            {category: ele}
        ).function(data.status)
        {
            console.log(data);
        }
    });
    //右边的标签点击
    $(".tag_item").click(function () {
        var ele = $(this).text();
        $.post('/search',
            {label: ele}
        ).function(data.status)
        {
            console.log(data);
        }
    });
    // 点击目录页面上的文字，滚动到相应的位置
    $(document).on('click', '#catalog li', function () {
        var ele_name = $(this).text();
        $("html, body").animate({scrollTop: $("#" + ele_name).offset().top - 110}, {
            duration: 500,
            easing: "swing"
        });
    });
})

