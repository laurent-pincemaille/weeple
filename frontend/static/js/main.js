const searchBtn = document.getElementById("recherche");

function parseXml(text,xpath){
    // Analysez les données XML
    const parser = new DOMParser();
    const xmlDoc = parser.parseFromString(text, "application/xml");

    // Sélectionnez tous les éléments 'name' de type 'primary'
    const element = xmlDoc.querySelectorAll(xpath);
    // Convert the HTML collection to an array
    const elementArray = Array.from(element);
    return elementArray
}

async function get_boardgames_ids(text) {
    try {
        const response = await fetch(`https://www.boardgamegeek.com/xmlapi2/search?type=boardgame&query=${text}`);
        
        if (!response.ok) {
            throw new Error(`Erreur lors de la récupération des données depuis BGG API - Statut : ${response.status}`);
        }

        const data = await response.text();

        // Vous pouvez maintenant analyser les données XML (par exemple, en utilisant la bibliothèque 'xml2js' ou 'xml-parser') pour extraire les informations sur les jeux de société.
        // Ici, nous affichons simplement les données pour l'exemple.
        itemArray = parseXml(data,'item')
        // Créez un tableau pour stocker les ids des jeux
        const games_id = [];
        // Parcourez les éléments 'name' et ajoutez les noms des jeux au tableau
        itemArray.forEach(item => {
            games_id.push(item.getAttribute('id'));
        });
        const firstFiveIds = games_id.slice(0, 5)
        console.log(firstFiveIds);

        return firstFiveIds;

    } catch (error) {
        console.error("Une erreur s'est produite : " + error);
        return null;
    }
}

function get_boardgameData_from_xml(data){
    // Parse the XML data
    const parser = new DOMParser();
    const xmlDoc = parser.parseFromString(data, "text/xml");
    // Sélectionnez tous les éléments "boardgame" dans le XML
    const boardgames = xmlDoc.querySelectorAll("boardgame");
    // Créez un taleau pour stocker les données
    const boardgameData = [];
    // Parcourez chaque élément "boardgame" et extrayez les noms et les images
    boardgames.forEach((boardgame) => {
                const name = boardgame.querySelector("name").textContent;
                const image = boardgame.querySelector("image").textContent;
                // Stockez les données dans un objet
                const gameData = {name,image,};
                // Ajoutez l'objet au tableau
                boardgameData.push(gameData);
                }                );
    return   boardgameData.push(gameData);

}
async function get_boardgames(text) {
    url = "http://localhost:5000/boardgames/"+text
    const response = await fetch(url);
    const data = await response.text();
    console.log(data)    
    return data;
}

// async function get_boardgames(text) {
//     try {
//         let ids = await get_boardgames_ids(text);
//         console.log("IDs received:", ids);
//         if (Array.isArray(ids)) {
//             const baseUrl = "https://boardgamegeek.com/xmlapi/boardgame/";
//             const url = baseUrl + ids.slice(0, 5).join(',');
//             const response = await fetch(url);
//             if (!response.ok) {
//                 throw new Error(`Erreur lors de la récupération des données depuis BGG API - Statut : ${response.status}`);
//             }

//             const data = await response.text();
//             boardgameData = get_boardgameData_from_xml(data)
//             console.log(boardgameData)
//             return data;
//         } else {
//             console.error("IDs is not an array:", ids);
//             return null;
//         }
//     } catch (error) {
//         console.error("Une erreur s'est produite : " + error);
//         return null;
//     }
// }



// Écoutez l'événement "input" sur le champ de recherche
searchBtn.addEventListener("input", () => {
    const searchTerm = searchBtn.value;
    if (searchTerm.trim() !== "") {
        get_boardgames(searchTerm)[0];
    } else {
        // Effacez les résultats si le champ de recherche est vide
        console.log("empty");
    }
});