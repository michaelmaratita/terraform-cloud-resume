// Check form inputs

function checkInputs() {
	const items = document.querySelectorAll('.item');

	for (const item of items) {
		if (item.value == '') {
			item.classList.add('error');
			item.parentElement.classList.add('error');
		}
		if (items[1].value != ''){
			checkEmail();
		}

		items[1].addEventListener('keyup', () => {
			checkEmail();

		});
		item.addEventListener('keyup', () => {
			if (item.value != '') {
				item.classList.remove('error');
				item.parentElement.classList.remove('error');
			}
			else {
				item.classList.add('error');
				item.parentElement.classList.add('error');
			}
		})
	}
}

// Check for valid email

function checkEmail() {
	const emailRegex = /^([a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,3})(\.[a-z]{2,3})?$/;
	const errorTxtEmail = document.querySelector('.error-txt.email');
	
	if (!email.value.match(emailRegex)) {
		email.classList.add('error')
		email.parentElement.classList.add('error')

		if (email.value != '') {
			errorTxtEmail.innerText = "Enter a valid Email Address"
		}
		else {
			errorTxtEmail.innerText = "Email Address can't be blank"
		}
	}
	else {
		email.classList.remove('error')
		email.parentElement.classList.remove('error')
	}
}

const formEl = document.querySelector('form')
const fullName = document.getElementById('name')
const email = document.getElementById('email')
const phone = document.getElementById('phone')
const subject = document.getElementById('subject')
const body = document.getElementById('message')

// On submit, send SNS or show Oops message

formEl.addEventListener('submit', event => {
	event.preventDefault();
	checkInputs();

	if (!fullName.classList.contains('error') && !email.classList.contains('error') && !phone.classList.contains('error')
	 && !subject.classList.contains('error') && !body.classList.contains('error')) {
		sendSNS();

		formEl.reset();
		return false;
	}
	else {
		Swal.fire({
			icon: "error",
			title: "Oops...",
			text: "Something went wrong!",
		  });
	}
});

// Send SNS through API Gateway

function sendSNS() {
	const formData = new FormData(formEl);
	const data = Object.fromEntries(formData);
	fetch('https://restapi.michaelmaratita.com/mail', {
		method: 'POST',
		headers: {
			'Content-Type' : 'application/json'
		},
		body: JSON.stringify(data)
	}).then(res => res.json())
	// .then(data => console.log(data.statusCode))
	.then (data => {
		if (data.statusCode == 200) {
			Swal.fire({
			title: "Success!",
			text: "Message was successfully sent!",
			icon: "success"
			});
		}
	})
	.catch(error => console.log(error));
}