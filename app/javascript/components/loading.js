function loading() {
  const eSigns = document.querySelectorAll('.pdf-sign');
  if(eSigns) {
    eSigns.forEach((eSign)=> {
      eSign.addEventListener('click', () => {
        const iLoadings = document.querySelector('.loader');
          iLoadings.classList.remove('hidden');
      })
    })
  }

}

export {loading}
