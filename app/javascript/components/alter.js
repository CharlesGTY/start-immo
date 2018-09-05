import swal from 'sweetalert';

const displayAlert = (statuts) => {
  if (statuts === "success")
  {
  swal({
  title: "Nouveau Mandat!",
  text: "Mandat envoyé pour signature aux adresses" <%= @document.house.user.email %> <%= @document.house.owner.email%>,
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
