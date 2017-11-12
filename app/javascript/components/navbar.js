function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-black');
  window.addEventListener('scroll', (event) => {
    if (window.scrollY >= window.innerHeight) {
      console.log(event);
      navbar.classList.remove('navbar-black-bottom');
    } else {
      navbar.classList.add('navbar-black-bottom');
    }
  });
}

export { initUpdateNavbarOnScroll };
