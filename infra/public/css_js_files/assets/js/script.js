let menu = document.querySelector('#menu-icon');
let navbar = document.querySelector('.navbar');

menu.onclick = () => {
    menu.classList.toggle('bx-x');
    navbar.classList.toggle('active');
}

const sr = ScrollReveal ({
        distance: '40px',
        duration: 2500,
        reset: true
});

sr.reveal('.home-text span', {delay: 680, origin: 'right'})
sr.reveal('.home-text h1', {delay: 680, origin: 'left'})
sr.reveal('.home-text p', {delay: 750, origin: 'right'})
sr.reveal('.main-btn', {delay: 860, origin: 'left'})
sr.reveal('.share', {delay: 950, origin: 'bottom'})
sr.reveal('.home-img img', {delay: 1000, origin: 'right'})

sr.reveal('#skills .heading', {delay: 200, origin: 'top'})
sr.reveal('.title', {delay: 400, origin: 'left'})
sr.reveal('.skills-box', {delay: 450, origin: 'left'})
sr.reveal('.progress h3', {delay: 520, origin: 'left'})
sr.reveal('.progress h3 span', {delay: 520, origin: 'right'})

sr.reveal('.work', {delay: 200, origin: 'top'})
sr.reveal('.btn-box', {delay: 400, origin: 'right'})
sr.reveal('.contact .heading', {delay: 200, origin: 'top'})
sr.reveal('.input-box', {delay: 200, origin: 'left'})
sr.reveal('.textarea-field', {delay: 200, origin: 'right'})


let sections = document.querySelectorAll('section');
let navLinks = document.querySelectorAll('header nav a');

window.onscroll = () => {
	sections.forEach(sec => {
		let top = window.scrollY;
		let offset = sec.offsetTop - 100;
		let height = sec.offsetHeight;
		let id = sec.getAttribute('id')

		if (top >= offset && top < offset + height) {
			// active navbar links
			navLinks.forEach(links => {
				links.classList.remove('active');
				document.querySelector('header nav a[href*=' + id + ']').classList.add('active');
			});

			// Commented out portions below are for having the site keep doing animation
			// sec.classList.add('show-animate');
		}
		// else {
		// 	sec.classList.remove('show-animate');
		// }
	});


	let header = document.querySelector('header');

	header.classList.toggle('sticky', window.scrollY > 100);

	// remove toggle icon and navbar when click nevbar links (scroll)
	menuIcon.classList.remove('bx-x');
	navbar.classList.remove('active');

}