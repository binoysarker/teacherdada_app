
<script>

    import Datepicker from 'vuejs-datepicker';
    import vueSlider from 'vue-slider-component';
    import Vodal from 'vodal';
    import Form from 'vform';

    export default {
        data: function () {
            return {
                course: [],
                coupons: [],
                saveStatus: null,
                showCreateForm: false,
                maxPercent: 100,
                showModal: false,
                showModal1: false,
                couponLink: '',
                copyStatus: null,
                savedCoursePrice: '',
                savedCourselevel: '',
                savedCourseduration: '',
                total: 0,
                firstValue: '',
                courselevel: '',
                totalduration: 0,
                basefees: 0,
                adminfees: 0,
                taxfees: 0,
                totalprice: 0,
                totalcouponprice: 500,
                
                 err: [],

                 form: new Form({
                    course_id: this.course_id,
                    code: '',
                    percent: 100,
                    quantity: 1,
                    expires: null
                })
                
            }
                
        },
        
        components: {
            Datepicker,
            vueSlider,
            Vodal
        },
        
        props: ['course_id'],
        
        methods: {

            fetchCourse(id){
                return axios.get('/api/author/course/'+id+'/fetchCourse').then((response) => {
                    this.course = response.data;
                    this.savedCoursePrice = this.course.price;
                    this.savedCourselevel = this.course.level;
                    this.savedCourseduration = this.course.duration;
                })
                .catch((error) => {
                    console.log('Could not fetch course');
                });
            },

            fetchNewcoupon()
           {
                // This can be an api call to the backend. change the logic here as required
                var secondValuecoupon = $('#dropdowncoupon').val();
              
                   switch (secondValuecoupon) {
                   case "couponid1":
                   var couponbasefees = 500;
                   this.totalcouponprice = couponbasefees;
                   break;
                   case "couponid2":
                   var couponbasefees = 2000;
                   this.totalcouponprice = couponbasefees;
                   break;
              }
               },
             // new function that fetches the price based on the dropdown selection
            fetchNewPrice(){
                // This can be an api call to the backend. change the logic here as required
                var secondValue = $('#dropdown2').val();
                var firstValue = $('#dropdown').val();
               var totalvalue =  firstValue + secondValue;
               switch (totalvalue) {
                   case "beginner1":
                   var basefees = 100;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
                   case "intermediate1":
                   var basefees = 125;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
                   case "advanced1":
                   var basefees = 150;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
                    case "beginner2":
                   var basefees = 150;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
                   case "intermediate2":
                   var basefees = 175;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
                   case "advanced2":
                   var basefees = 200;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
                    case "beginner3":
                   var basefees = 200;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
                   case "intermediate3":
                   var basefees = 250;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
                   case "advanced3":
                   var basefees = 300;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
                   case "beginner4":
                   var basefees = 250;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
                   case "intermediate4":
                   var basefees = 300;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
                   case "advanced4":
                   var basefees = 350;
                   var tdfee = (basefees*13/100);
                   var Tax = (basefees*18/100);
                   this.courselevel = firstValue;
                   this.totalduration = secondValue;
                   this.basefees = basefees;
                   this.adminfees = tdfee;
                   this.taxfees = Tax;
                   this.totalprice = basefees+tdfee+Tax;
                   break;
         }
            },
            createCoupon(){
                this.saveStatus = this.trans('t.saving') + '...';
                
                this.form.post('/api/author/course/coupon')
                    .then(({ data }) => {
                        this.showCreateForm = false;
                        this.saveStatus = this.trans('t.saved');
                        setTimeout(() => {
                           this.saveStatus = null 
                        }, 3000);
                        this.fetchCoupons();
                    }) 
            },

        
            submit1(){
                this.saveStatus = this.trans('t.saving') + '...';
                
                this.form.post('/api/author/course/generatecoupon')
                    .then(({ data }) => {
                        this.saveStatus = this.trans('t.saved');
                        setTimeout(() => {
                           this.saveStatus = null 
                        }, 3000);
                       this.fetchCoupons();
                    }) 
                  
            },
            
            fetchCoupons(){
                return axios.get('/api/author/course/' + this.course_id + '/coupons').then((response) => {
                    this.coupons = response.data.data;
                    this.total = response.data.used_coupon_total;
                })
                .catch((error) => {
                    console.log(error);
                })
            },
            
            toggleActive(id, status){
                this.saveStatus = this.trans('t.updating');
                axios.put('/api/author/coupon/'+id+'/activate',{
                    id: id,
                    status:status
                }).then((response) => {
                    this.fetchCoupons();
                    this.saveStatus = this.trans('t.status-updated');
                    setTimeout(() => {
                       this.saveStatus = null 
                    }, 3000);
                }).catch((error) => {
                    console.log(error);
                })
            },
            getLink(link){
                this.showModal=true; 
                this.couponLink=link;
            },
            copyToClipboard(){
                document.querySelector('#couponLink').select();
                document.execCommand('copy');  
                this.copyStatus = this.trans('t.copied-to-clipboard');
                setTimeout(() => {
                   this.copyStatus = null 
                }, 3000);
            },
            updatePrice(){
                this.saveStatus = 'Updating';
                axios.put('/api/author/courses/' + this.course_id +'/updatePrice', {
                    price: this.totalprice,
                    level: this.course.level,
                    duration: this.course.duration,
                    
                }).then((response) => {
                    this.saveStatus = this.trans('t.price-updated');
                    setTimeout(() => {
                       this.saveStatus = null 
                    }, 3000);
                    this.fetchCourse(this.course_id);
                    this.fetchCoupons();
                }).catch((error) => {
                    console.log(error);
                })
            },
            
            
    
        },

        mounted(){
            this.fetchCoupons();
            return axios.get('/api/author/course/'+this.course_id+'/fetchCourse').then( (response) => {
                this.course = response.data;
                this.totalprice = this.course.price;
                this.savedCoursePrice = this.course.price;
                this.savedCourselevel = this.course.level;
                this.savedCourseduration = this.course.duration;
               
                
               
            });
            
            
        }
    }

</script>


