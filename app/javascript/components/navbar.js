function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-black');
  window.addEventListener('scroll', (event) => {
    const halfWin = window.innerHeight / 2;
    if (window.scrollY >= halfWin) {
      console.log(event);
      navbar.classList.remove('navbar-black-bottom');
    } else {
      navbar.classList.add('navbar-black-bottom');
    }
  });
}

export { initUpdateNavbarOnScroll };
