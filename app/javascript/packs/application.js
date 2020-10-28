// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import jquery from 'jquery';
window.$ = window.jquery = jquery;
import 'bootstrap'
//= require 'china_city/jquery.china_city'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//博客内容使用的js
$(document).ready(function () {
    //分类筛选
    $(document).on('click', ".category-item", function () {
        var ele = $(this).text();
        $.post('/search',
            {category: ele}
        ).function(data.status)
        {
            console.log(data);
        }
    });
    //右边的标签点击
    $(document).on('click', ".tag_item", function () {
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

    //编辑简历时，编辑框和展示框的切换,这是基本信息框
    $(document).on('click', ".user_basic_edit", function () {
        $(".edit_user_info").removeClass("d-none");
        $(".edit_user_info").addClass("d-block");
        $(".user_info_show").removeClass("d-block");
        $(".user_info_show").addClass("d-none");
    });
    //取消按钮
    $(document).on('click', "#edit_user_info_cancel", function () {
        $(".edit_user_info").removeClass("d-block");
        $(".edit_user_info").addClass("d-none");
        $(".user_info_show").removeClass("d-none");
        $(".user_info_show").addClass("d-block");
    });

    //编辑简历时，编辑框和展示框的切换,这是求职意愿框
    $(document).on('click', ".user_objective_edit", function () {
        $(".edit_objective").removeClass("d-none");
        $(".edit_objective").addClass("d-block");
        $(".user_objective_show").removeClass("d-block");
        $(".user_objective_show").addClass("d-none");
    });
    //取消按钮
    $(document).on('click', "#edit_user_objective_cancel", function () {
        $(".edit_objective").removeClass("d-block");
        $(".edit_objective").addClass("d-none");
        $(".user_objective_show").removeClass("d-none");
        $(".user_objective_show").addClass("d-block");
    })

    //检查上传的照片的大小
    $('#user_picture').bind('change', function () {
        var pictue_size = this.files[0].size / 1024 / 1024;
        if (pictue_size > 1) {
            alert('照片最大不得超过1MB，请选择小一些的照片');
        }
    })

})

