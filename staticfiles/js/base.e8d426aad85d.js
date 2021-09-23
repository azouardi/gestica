// static/js/base.js
console.log('JavaScript here!')

const copyBtns = [...document.getElementsByClassName('copy-btn')]
console.log(copyBtns)

let previous = null

copyBtns.forEach(btn=> btn.addEventListener('click', ()=>{
    // console.log('click')
    const username = btn.getAttribute('data-username')
    // console.log(username)
    navigator.clipboard.writeText(username)
    btn.textContent='Copied'
    navigator.clipboard.readText().then(clipText=>{
        console.log(clipText)
        btn.textContent= `Copied ${clipText}`
    })

    if (previous) {
        previous.textContent='Copy'
    }
    previous = btn
}))


//Bootstrap 5 sidebar menu with toggle button
document.addEventListener("DOMContentLoaded", function(event) {

    const showNavbar = (toggleId, navId, bodyId, headerId) =>{
    const toggle = document.getElementById(toggleId),
    nav = document.getElementById(navId),
    bodypd = document.getElementById(bodyId),
    headerpd = document.getElementById(headerId)
    
    // Validate that all variables exist
    if(toggle && nav && bodypd && headerpd){
    toggle.addEventListener('click', ()=>{
    // show navbar
    nav.classList.toggle('show')
    // change icon
    toggle.classList.toggle('bx-x')
    // add padding to body
    bodypd.classList.toggle('body-pd')
    // add padding to header
    headerpd.classList.toggle('body-pd')
    })
    }
    }
    
    showNavbar('header-toggle','nav-bar','body-pd','header')
    
    /*===== LINK ACTIVE =====*/
    const linkColor = document.querySelectorAll('.nav_link')
    
    function colorLink(){
    if(linkColor){
    linkColor.forEach(l=> l.classList.remove('active'))
    this.classList.add('active')
    }
    }
    linkColor.forEach(l=> l.addEventListener('click', colorLink))
    
    // Your code to run since DOM is loaded and ready
    });