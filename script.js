
let series = [];

function addSeries() {
    const titleInput = document.getElementById('seriesTitle');
    const seasonsInput = document.getElementById('seriesSeasons');
    const title = titleInput.value.trim();
    const seasons = parseInt(seasonsInput.value);


    if (title === "") {
        alert('Введите название сериала!');
        return;
    }

   
    const newSeries = {
        id: Date.now(),
        title: title,
        seasons: seasons || 1,
        status: 'Запланировано', // Статус по умолчанию
        rating: null
    };

    series.push(newSeries);
    
    
    titleInput.value = '';
    seasonsInput.value = '';
    
    renderSeries();
}

function renderSeries() {
    const list = document.getElementById('seriesList');
    list.innerHTML = '';
    
    series.forEach(item => {
        const li = document.createElement('li');
        li.innerHTML = `
            <span><strong>${item.title}</strong> (${item.seasons} сез.)</span>
        `;
        list.appendChild(li);
    });
}
