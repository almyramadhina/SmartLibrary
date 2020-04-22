const addBuku = async() => {
	const data = await JSON.stringify({
        id_buku:document.getElementById("m_id_buku").value,
		judul:document.getElementById("m_judul").value,
        author:document.getElementById("m_author").value,	
        lokasi:document.getElementById("m_lokasi").value,
        jml_total:document.getElementById("m_jml_total").value,
	})
	console.log(data);
	const response = await fetch('https://itbsmartlibrary.herokuapp.com/buku/add',{
		method:'POST',
		headers:{ 
			'Content-Type':'application/json'
		},
		body: data
	})
	const json = await response.json();
	console.log(json);
}