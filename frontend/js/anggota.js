const addUmum = async() => {
	const data = await JSON.stringify({
        nama:document.getElementById("m_nama").value,	
        alamat:document.getElementById("m_alamat").value,
        no_hp:document.getElementById("m_no_hp").value,
        email:document.getElementById("m_email").value,
		pekerjaan:document.getElementById("m_job").value,
	})
	console.log(data);
	const response = await fetch('https://itbsmartlibrary.herokuapp.com/anggota/register',{
		method:'POST',
		headers:{ 
			'Content-Type':'application/json'
		},
		body: data
	})
	const json = await response.json();
	console.log(json);
}