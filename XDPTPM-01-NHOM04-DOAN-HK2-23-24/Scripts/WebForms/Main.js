// NAV
const navMenu = document.querySelector('#nav-menu'),
    toggleIcon = document.querySelector('#nav-toggle i'),
    toggleBtn = document.querySelector('#nav-toggle')
toggleBtn.onclick = function () {
    navMenu.classList.toggle('show_menu')
}