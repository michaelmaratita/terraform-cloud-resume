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
            const view_count = data.views
            const views = document.getElementById('views');
            views.innerHTML = `${view_count}`
        });
};