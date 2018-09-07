

<script>

    export default {
        data() {
            return {
                razorpay_payment_id: '',
                options: {
                    key: this.settings('rzk'),
                    amount: this.price*100,
                    name: this.settings('site_name'),
                    image: this.settings('img'),
                    description: this.desc,
                    external: {
                   
                                 wallets: ['paytm'],
                                 
                             },
                    handler: this.handler,
                    
                    theme: {
                        color: "#168AFA"
                    },
                    modal: {
                        escape: false
                    },
                   
                    
                },
            }
        },
        
        props: [
            'price',
            'desc',
            'id'
        ],
        
        methods: {
            handler(response){
                $('#razorpay_payment_id-'+this.id).val(response.razorpay_payment_id);
                $('#razorpayform-'+this.id).submit();
            },
            
            
        },
       
        mounted() {

            var rzp_popup = new Razorpay(this.options);
            
            document.getElementById('razorpay-btn-'+this.id).onclick = (e) => {
                
                e.preventDefault();
                var rzp_popup = new Razorpay(this.options);
                rzp_popup.open();
                
            }
        }
    }
</script>
