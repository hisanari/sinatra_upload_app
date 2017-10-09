file = document.getElementById("file")

file.onchange = () =>
  if file.files.length > 0
    document.getElementById('filename').innerHTML = file.files[0].name
