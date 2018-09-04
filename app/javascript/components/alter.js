import swal from 'sweetalert';

const displayAlert = (statuts) => {
  if (statuts === "success")
  {
  swal({
  title: "Nouveau Mandat!",
  text: "Mandat envoyé pour signature aux adresses ",
  icon: "success"})
  }
  else
  {
  swal({
  title: "error",
  text: "Crotte",
  icon: "error"})
  }
}

 export { displayAlert };
