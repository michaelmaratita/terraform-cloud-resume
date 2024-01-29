window.onload = function() {
    fetch('https://restapi.michaelmaratita.com/viewers', {
		method: 'POST',
		headers: {
			'Content-Type' : 'application/json'
		},
		body: JSON.stringify("no_data")
	}).then(res => res.json())
        .then(data => {
			console.log(data.views)
            const viewer_count = data.views
            const viewers = document.getElementById('viewers');
            viewers.innerHTML = `${viewer_count}`
        });
};