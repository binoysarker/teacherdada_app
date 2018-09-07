

<script>
import vueSlider from 'vue-slider-component';

    export default {
        data() {
            return {
                razorpay_payment_id1: '',
                options: {
                    key: this.settings('rzk'),
                    amount: this.price*100,
                    name: this.settings('site_name'),
                    image: this.settings('img'),
                    description: this.desc,
                    handler: this.handler,
                    theme: {
                        color: "#168AFA"
                    },
                    modal: {
                        escape: true
                    }
                     
                },
              
            }
        },
         components: {
                        vueSlider,
        },
        
        props: [
            
            'price',
            'desc',
            'id'
        ],
        
        methods: {
            handler(response){
                $('#razorpay_payment_id-'+this.id).val(response.razorpay_payment_id1);
                $('#razorpayform-'+this.id+'1').submit();
            },
            
        },
        
        mounted() {

          
             var rzp_popup = new Razorpay(this.options);
            document.getElementById('razorpay-btn-'+this.id+'1').onclick = (e) => {
                
              e.preventDefault();
                var rzp_popup = new Razorpay(this.options);
                rzp_popup.open();
                
            }
        }
    }
</script>
