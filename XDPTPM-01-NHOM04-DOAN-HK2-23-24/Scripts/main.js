const navMenu = document.getElementById('nav-menu'),
    navToggle = document.getElementById('nav-toggle')

navToggle.addEventListener('click', () => {
    if (navMenu.classList.contains('show_menu')) {
        navMenu.classList.remove('show_menu')
    } else {
        navMenu.classList.add('show_menu')
    }
})