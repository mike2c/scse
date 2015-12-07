(function($){
	$.fn.extend({
		valida: function(){
            var ced = new ValidarCedula();
            var cedula = $(this);
            ced.setCedula(cedula.val());
            if(cedula.val()==""){
                return true
            }else{       
                if(ced.isCedulaValida(cedula.val())){
                    return true
                }else{
                    return false
                }
            }
		}
	});
})(jQuery)

String.prototype.replaceAll=function(s1, s2) {return this.split(s1).join(s2)}
String.prototype.ltrim=function() {return this.replace(/^\s+/, "");}
String.prototype.rtrim=function() {return this.replace(/\s+$/, "");}
String.prototype.trim=function() {return this.rtrim(this.ltrim(this));}

function ValidarCedula(){
    this.LETRAS = "ABCDEFGHJKLMNPQRSTUVWXY";
    this.cedula = null;
	
    /**
     * Fiajr el N�mero de C�dula
     * 
     * @param cedula N�mero de C�dula con o sin guiones
     */
    this.setCedula =  function(cedula) {
        this.cedula = cedula.trim().replaceAll("-","");
		
        if(this.cedula == null || this.cedula.length != 14)
            this.cedula = null;
        else
        this.cedula = this.cedula.toUpperCase();
    }
	
    /**
     * Retorna true si la c�dula es v�lida
     * false en caso contrario
     * 
     * @return
     */
    this.isCedulaValida = function() {
        if(!this.isPrefijoValido())
            return false;
            
        if(!this.isFechaValida())
            return false;
            
        if(!this.isSufijoValido())
            return false;
        
        if(!this.isLetraValida())
            return false;
            
        return true;
    }
	
    /**
     * Retorna true si el prefijo de la c�dula es v�lida
     * false en caso contrario
     * 
     * @return
     */
    this.isPrefijoValido = function() {
        var prefijo = this.getPrefijoCedula();
        
        if(prefijo==null) return false;
        
	var re = new RegExp("^[0-9]{3}$");
	if (prefijo.search(re) == -1)
            return false;
			
        return true;
    }
	
    /**
     * Retorna true si la fecha de la c�dula es v�lida
     * false en caso contrario
     * 
     * @return
     */
    this.isFechaValida = function() {
        var fecha = this.getFechaCedula();
        
        if(fecha == null) return false;
        
	var re = new RegExp("^(0[1-9]|[12][0-9]|3[01])(0[1-9]|1[012])([0-9]{2})$");
	if (fecha.search(re) == -1)
        return false;
            
        return true;
    }
	
    /**
     * Retorna true si el sufijo de la c�dula es v�lida
     * false en caso contrario
     * 
     * @return
     */
    this.isSufijoValido = function() {
        var sufijo = this.getSufijoCedula();
        
        if(sufijo == null) return false;
        
	var re = new RegExp("^[0-9]{4}[A-Y]$");
	if (sufijo.search(re) == -1)
        return false;
        
        return true;
    }
	
    /**
     * Retorna true si la letra de la c�dula es v�lida
     * false en caso contrario
     * 
     * @return
     */
    this.isLetraValida = function() {
        var letraValida = null;
        var letra = this.getLetraCedula();
        
        if(letra == null) return false;
        
        letraValida = this.calcularLetra();
        
        return (letraValida == letra);
	}
	
    /**
     * Retorna un entero que representa la posici�n en la cadena LETRAS 
     * de la letra final de una c�dula
     * 
     * @return
     */
    this.getPosicionLetra = function() {
        var posicionLetra = 0;
        var cedulaSinLetra = this.getCedulaSinLetra();
        var numeroSinLetra = 0;
        
        if(cedulaSinLetra == null) return -1;
        
        numeroSinLetra =  cedulaSinLetra;
                
        posicionLetra = (numeroSinLetra - Math.floor(numeroSinLetra/23.0) * 23);
        
        return posicionLetra;
    }
    
    /**
     * <p>
     * Calcular la letra al final de la c�dula nicaraguense.
     * </p><p>
     * Basado en el trabajo de: Arnoldo Suarez Bonilla - arsubo@yahoo.es
     * </p><p>
     * La letra se calcula con el siguiente algoritmo (yo se los env�o en SQL).
     * <p>
     * <pre>
     * declare  @cedula      varchar(20),
     *          &#64;val         numeric(13, 0),
     *          &#64;letra       char(1),
     *          &#64;Letras      varchar(20)
     *          
     *          select @Letras = 'ABCDEFGHJKLMNPQRSTUVWXY'
     *          select @cedula = '0012510750012' --PARTE NUMERICA DE LA CEDULA SIN GUIONES
     *          --CALCULO DE LA LETRA DE LA CEDULA   
     *          select @val = convert(numeric(13, 0), @cedula) - floor(convert(numeric(13, 0), @cedula) / 23) * 23
     *          select @letra = SUBSTRING(@Letras, @val + 1, 1)
     *          select @letra
     * </pre> 
     * @return Letra v�lida de c�dula dada
     */
    this.calcularLetra = function() {
        var posicionLetra = this.getPosicionLetra();
        
        if(posicionLetra <0 || posicionLetra >= this.LETRAS.length)
            return '?';
            
        return this.LETRAS.charAt(posicionLetra);
    }

    /**
     * Retorna el N�mero de C�dula
     * @return 
     */	
    this.getCedula = function() {
        return this.cedula;
    }
	
    /**
     * Retorna el prefijo de la c�dula
     * @return
     */
    this.getPrefijoCedula = function() {
        if(this.cedula!=null)
            return this.cedula.substring(0,3);
        else 
            return null;
    }
    
    /**
     * Retorna la fecha en la c�dula
     * @return
     */
    this.getFechaCedula = function() {
        if(this.cedula!=null)
            return this.cedula.substring(3,9);
        else 
            return null;
    }
    
    /**
     * Retorna el sufijo en la c�dula
     * @return
     */
    this.getSufijoCedula = function() {
        if(this.cedula!=null)
            return this.cedula.substring(9,14);
        else 
            return null;
    }
    
    /**
     * Retorna la letra de la c�dula
     * @return
     */
    this.getLetraCedula = function() {
        if(this.cedula!=null)
            return this.cedula.substring(13,14);
        else 
            return null;
    }
	
    /**
     * Retorna la c�dula sin la letra de validaci�n
     * @return
     */
    this.getCedulaSinLetra = function() {
        if(this.cedula!=null)
            return this.cedula.substring(0,13);
        else 
            return null;
    }
}