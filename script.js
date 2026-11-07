
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
            <select onchange="changeStatus(${item.id}, this.value)">
                <option value="Запланировано" ${item.status === 'Запланировано' ? 'selected' : ''}>Запланировано</option>
                <option value="Смотрю" ${item.status === 'Смотрю' ? 'selected' : ''}>Смотрю</option>
                <option value="Просмотрено" ${item.status === 'Просмотрено' ? 'selected' : ''}>Просмотрено</option>
                <option value="Брошено" ${item.status === 'Брошено' ? 'selected' : ''}>Брошено</option>
            </select>
            <input type="number" min="1" max="10" placeholder="Оценка" 
                   value="${item.rating || ''}" 
                   onchange="setRating(${item.id}, this.value)">
        `;
        list.appendChild(li);
    });
}

function setRating(id, value) {
    const rating = parseInt(value);
    if (rating < 1 || rating > 10) {
        alert('Оценка должна быть от 1 до 10!');
        return;
    }
    const item = series.find(s => s.id === id);
    if (item) {
        item.rating = rating;
    }
}

function changeStatus(id, newStatus) {
    const item = series.find(s => s.id === id);
    if (item) {
        item.status = newStatus;
    }
}
