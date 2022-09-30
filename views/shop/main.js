const shop_imgs = document.querySelectorAll(".shop_img");
const show_menus = document.querySelectorAll(".show_menu");

for (let i = 0; i < shop_imgs.length; i++) {
  shop_imgs[i].addEventListener("mouseover", function () {
    show_menu_button(i);
  });
  shop_imgs[i].addEventListener("mouseout", function () {
    hide_menu_button(i);
  });
  show_menus[i].addEventListener("mouseover", function () {
    show_menu_button(i);
  });
}

function show_menu_button(i) {
  shop_imgs[i].style.filter = "brightness(50%)";
  show_menus[i].style.display = "block";
}
function hide_menu_button(i) {
  shop_imgs[i].style.filter = "brightness(100%)";
  show_menus[i].style.display = "none";
}
