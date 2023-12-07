import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller-profile"
export default class extends Controller {
  static targets = ['profilecard' ]
  connect() {
    console.log('hello');
  }



enlarge(e) {
  console.log("clicked!");
  // console.log(e.currentTarget);
  // console.log(this.profilecardTargets);
  // this.profileTargets.foreach((box) => {
  //   console.log(box);
  // });


  // if (!e.currentTarget.classList.contains('profile-clicked')){
  //   e.currentTarget.classList.add('profile-clicked');
  // }
  // else {
  //   e.currentTarget.classList.remove('profile-clicked');
  //   this.profile-info-boxTargets.foreach((box) => {
  //     box.classList.remove('profile-clicked');
  //   }
  //   )};
}
}
