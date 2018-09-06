import swal from 'sweetalert';

const displayAlert = (statuts) => {
  if (statuts === "success") {
    swal({
    title: "Nouveau Mandat!",
    text: "Mandat envoyé pour signature",
    icon: "success"})
    const iLoadings = document.querySelector('.loader');
    iLoadings.classList.add('hidden');
  } else {
    swal({
    title: "error",
    text: "Erreur",
    icon: "error"})
  }
}

export { displayAlert };
