import { Controller } from "stimulus"

export default class extends Controller {
  /*connect() {
    this.element.textContent = "Hello World!"
  }*/

  static targets = ["day", "month", "year", "reviewid", "entid", "output"]
  new_date() {
    var new_day = this.dayTarget.value
    var new_month = this.monthTarget.value
    var new_year = this.yearTarget.value
    var my_date = new_year + "-" + new_month + "-" + new_day
    var entid = this.entidTarget.value
    var reviewid = this.reviewidTarget.value
    window.location.href="photos?reviewid="+reviewid+"&date="+my_date
  }
}
