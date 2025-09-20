//
//  ContentView.swift
//  nu
//
//  Created by Karime Yuanel Ruiz Cerón on 14/09/25.
//

// VStack = Vertical Stack
// Sirve para acomodar los elementos en columna (uno debajo del otro).
//VStack {
    //Text("Arriba")
    //Text("Abajo")
//}


// HStack = Horizontal Stack
// Sirve para acomodar los elementos en fila (uno al lado del otro).
//HStack {
    //Text("Izquierda")
    //Text("Derecha")
//}


// ZStack = Z-axis Stack
// Sirve para acomodar los elementos en capas (uno encima del otro).
//ZStack {
    //Color.blue                // capa de fondo
    //Circle().fill(.red)       // encima del fondo
    //Text("Encima de todo")    // encima del círculo
//}

import SwiftUI   // Importa el framework SwiftUI para construir interfaces

struct ContentView: View {
    
    //declarar las variables SIEMPRE ANTES DEL BODY
    @State var cambio = true //para cambiar el contenido //true para condicionar las acciones
    @State var ojo = "eye" //para cambiar el contenido
    @State var dinero = "$0.00" //para cambiar el contenido
    
    
    
    var body: some View {
        
        // ScrollView: permite que TODO el contenido sea desplazable verticalmente
        ScrollView {
            
            // VStack: apila el header morado y la franja negra uno debajo del otro
            // spacing: 0 → no deja hueco entre el header morado y la franja negra
            VStack(spacing: 0) {
                
                
                
                // ===== HEADER MORADO =====
                ZStack(alignment: .topLeading) { // ZStack superpone elementos (uno encima de otro).
                                                 // alignment: .topLeading = alinear el contenido arriba a la izquierda.
                    
                    Color(red: 0.38, green: 0.08, blue: 0.60) // color morado de fondo
                        .frame(height: 220)                   // altura fija del header
                        .ignoresSafeArea(edges: .top)         // hace que el morado suba hasta cubrir el notch
                    
                    
                    
                    
                    // --- Fila de íconos superiores ---
                    HStack(spacing: 24) { // HStack = fila horizontal; spacing = separación entre íconos
                        
                        // círculo grande con ícono dentro
                        ZStack { // ZStack se usa para poner el ícono encima del círculo
                            Circle() // círculo
                                .fill(Color.white.opacity(0.18)) // círculo translúcido blanco
                                .frame(width: 56, height: 56)   // tamaño del círculo
                            
                            Image(systemName: "photo.badge.plus") // ícono dentro del círculo
                                .font(.title2)                   // tamaño del ícono
                        }
                        
                        Spacer() // empuja los demás íconos hacia la derecha
                        
                        
                        //-------BOTON PARA CAMBIAR EL OJO------
                        Button(action: {
                            
                            withAnimation() {
                                
                                if cambio { //si la variable cambio es sigual a verdadero
                                    cambio = false //va a cambiar de true a false
                                    ojo = "eyebrow" //va a cambiar el ojo de abierto a cerradoi
                                    dinero = "****" //cambia la cantidad de dinero a ***
                                } else {
                                    cambio = true //va a cambiar de false a true
                                    ojo = "eye" //va a cambiar el ojo de cerrado a abierto
                                    dinero = "$0.00" //cambia de *** a dinero
                                }
                                
                            }
                            
                        }) {
                            
                            Image(systemName: ojo) // ícono del ojo //las variables se colocan sin comillas
                           
                                .font(.title2)      // tamaño del ícono
                        }
                        
                        Image(systemName: "questionmark.circle") // ícono de pregunta
                            .font(.title2)
                        
                        Image(systemName: "person.2.badge.plus") // ícono de personas
                            .font(.title2)
                    }
                    .foregroundColor(.white)  // color blanco para todos los íconos
                    .padding(.horizontal, 20) // margen a izquierda y derecha
                    .padding(.top, 10)        // separación desde arriba
                    
                    
                    
                    
                    
                    // --- Tarjeta blanca flotante ---
                    HStack(spacing: 12) { // fila horizontal con separación entre elementos
                        
                        // círculo de la izquierda con ícono de tarjeta
                        ZStack {
                            Circle()
                                .fill(Color.purple.opacity(0.15)) // círculo lila claro
                                .frame(width: 42, height: 42)     // tamaño del círculo
                            
                            Image(systemName: "creditcard.fill") // ícono de tarjeta
                                .font(.subheadline)              // tamaño pequeño
                                .foregroundColor(.purple)        // color morado
                        }
                        
                        Text("Haz crecer tu línea de crédito y tus ahorros") // texto de la tarjeta
                            .font(.subheadline)      // tamaño pequeño
                            .foregroundColor(.purple) // color morado
                            .lineLimit(2)            // máximo dos líneas
                        
                        Spacer() // empuja el ícono de opciones a la derecha
                        
                        Image(systemName: "square.and.arrow.up") // ícono de opciones
                            .foregroundColor(.purple) // color morado
                    }
                    .padding(16) // espacio interno de la tarjeta
                    .background( // fondo de la tarjeta
                        RoundedRectangle(cornerRadius: 26) // esquinas redondeadas
                            .fill(Color.white)            // relleno blanco
                    )
                    .shadow(color: .black.opacity(0.12), radius: 3, x: 0, y: 1) // sombra ligera
                    .padding(.horizontal, 16) // margen lateral de la tarjeta
                    .padding(.top, 90)        // baja la tarjeta dentro del header
                }
                
                
                
                
                // ===== FRANJA NEGRA (Cuenta Nu) =====
                VStack(alignment: .leading, spacing: 8) { // VStack = columna alineada a la izquierda; spacing = separación entre textos
                    
                    // fila 1: título + chevron
                    HStack {
                        Text("Cuenta Nu") // título de la sección
                            .font(.title3)       // tamaño título pequeño
                            .fontWeight(.semibold) // semibold = semi-negrita
                        
                        Spacer() // empuja el ícono de chevron a la derecha
                        
                        Image(systemName: "chevron.right") // ícono de flecha
                            .font(.subheadline)           // tamaño pequeño
                            .foregroundColor(.white)       // gris sutil
                    }
                    
                    // fila 2: monto debajo del título
                    Text(dinero) // monto en grande //las variables se declaran sin comillas
                        .font(.title3)     // tamaño grande
                        .fontWeight(.bold)     // negritas
                        .monospacedDigit()     // dígitos fijos (no se mueven al cambiar)
                }
                .padding(.horizontal, 16) // margen lateral de la franja
                .padding(.vertical, 14)   // respiro arriba y abajo de la franja
                .frame(maxWidth: .infinity, alignment: .leading) // ocupa todo el ancho disponible
                .foregroundColor(.white)  // textos en blanco
                .background(Color.black)  // fondo negro de la franja
                
                
                
                
                //----- ICONOS SCROLL VIEW HORIZONTAL (versión estable) -----
                ScrollView(.horizontal, showsIndicators: false) {     // ScrollView en horizontal → permite desplazar ítems de lado a lado
                                                                      // showsIndicators: false → oculta la barrita de scroll (se ve más limpio)

                    HStack(alignment: .top, spacing: 24) {            // HStack → organiza los ítems en fila
                                                                      // alignment: .top → todos los ítems alineados arriba (círculos al mismo nivel)
                                                                      // spacing: 24 → deja 24 puntos de espacio entre cada ítem

                        // === Ítem 1 ===
                        VStack(spacing: 8) {                          // VStack → acomoda en columna: círculo arriba, texto abajo
                                                                      // spacing: 8 → deja 8 puntos entre el círculo y el texto
                            
                            ZStack {                                  // ZStack → superpone elementos: círculo gris de fondo + ícono encima
                                Circle()                              // Dibuja un círculo
                                    .fill(Color(hue: 0.0, saturation: 0.051, brightness: 0.104)) // Rellena el círculo con un gris oscuro
                                    .frame(width: 80, height: 80)     // Tamaño fijo del círculo (80x80)
                                
                                Image(systemName: "creditcard.viewfinder") // Ícono SF Symbol
                                    .resizable()                      // Se puede redimensionar
                                    .scaledToFit()                    // Mantiene proporción al ajustarse
                                    .frame(width: 50, height: 50)     // Tamaño fijo para que no se vea enorme
                            }
                            .overlay(                                 // overlay → agrega un elemento ENCIMA del círculo
                                Text("Nuevo")                         // Texto de etiqueta "Nuevo"
                                    .font(.caption2).bold()           // Fuente pequeña + negrita
                                    .foregroundColor(.white)          // Color del texto en blanco
                                    .padding(.horizontal, 8)          // Relleno interno a los lados de la pastilla
                                    .padding(.vertical, 2)            // Relleno arriba/abajo de la pastilla
                                    .background(                      // Fondo para la pastilla
                                        RoundedRectangle(cornerRadius: 6) // Rectángulo con esquinas redondeadas
                                            .fill(Color.purple)           // Fondo morado
                                    )
                                    .padding(.bottom, -6),            // Ajuste negativo para pegarla más al borde inferior del círculo
                                alignment: .bottom                    // La coloca en el borde inferior del círculo
                            )
                            
                            Text("Recibir y\ndepositar")              // Texto debajo del círculo (dos líneas)
                                .font(.footnote)                      // Fuente tamaño footnote (pequeña)
                                .multilineTextAlignment(.center)      // Alinea el texto al centro
                                .fixedSize(horizontal: false, vertical: true) // Hace que no se colapse verticalmente (mantiene altura fija)
                        }
                        .frame(width: 96, height: 120, alignment: .top) // Le da ancho fijo (96) y alto fijo (120)
                                                                       // → Esto ayuda a que todas las cards midan lo mismo y queden alineadas
                        //.background(Color.red.opacity(0.1))          // (debug) → ver la caja de la card con color de prueba

                        // === Ítem 2 ===
                        VStack(spacing: 8) {                          // Segunda card con el mismo patrón
                            ZStack {
                                Circle()
                                    .fill(Color(red: 0.133, green: 0.133, blue: 0.133)) // Círculo gris oscuro
                                    .frame(width: 80, height: 80)     // Mismo tamaño
                                Image(systemName: "creditcard")       // Ícono de tarjeta
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)     // Mismo tamaño que el anterior
                            }
                            
                            Text("Transferir")                        // Texto de la card
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true) // Mantiene altura estable
                        }
                        .frame(width: 96, height: 120, alignment: .top)

                        // === Ítem 3 ===
                        VStack(spacing: 8) {                          // Tercera card
                            ZStack {
                                Circle()
                                    .fill(Color(red: 0.133, green: 0.133, blue: 0.133)) // Círculo gris oscuro
                                    .frame(width: 80, height: 80)
                                Image(systemName: "dollarsign.circle") // Ícono de símbolo de dólar
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            .overlay(                                 // Overlay para etiqueta con monto
                                Text("$2,000")                        // Texto de la etiqueta
                                    .font(.caption2).bold()           // Pequeño y en negrita
                                    .foregroundColor(.white)          // Texto blanco
                                    .padding(.horizontal, 8)          // Espacio lateral
                                    .padding(.vertical, 2)            // Espacio arriba/abajo
                                    .background(                      // Fondo morado
                                        RoundedRectangle(cornerRadius: 6).fill(Color.purple)
                                    )
                                    .padding(.bottom, -6),            // Lo acerca al borde inferior
                                alignment: .bottom
                            )
                            
                            Text("Simular\npréstamo")                 // Texto debajo (dos líneas)
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(width: 96, height: 120, alignment: .top)
                        
                        //---------------item 4------------
                        
                        VStack(spacing: 8){
                            
                            ZStack{
                                Circle()
                                    .fill(Color(red: 0.133, green: 0.133, blue: 0.133))
                                    .frame(width:80, height: 80)
                                
                                Image(systemName: "dollarsign")
                                    .resizable() //permite que se pueda modificar el tamaño
                                    .scaledToFit() //para que quepa toda la imagen en el recuadro
                                    .frame(width: 50, height: 50)
                                
                            }
                            .overlay(
                                Text("$7,981")
                                    .font(.caption2).bold()           // Pequeño y en negrita
                                    .foregroundColor(.white)          // Texto blanco
                                    .padding(.horizontal, 8)          // Espacio lateral
                                    .padding(.vertical, 2)            // Espacio arriba/abajo
                                    .background(                      // Fondo morado
                                        RoundedRectangle(cornerRadius: 6).fill(Color.purple)
                                    )
                                    .padding(.bottom, -6),            // Lo acerca al borde inferior
                                alignment: .bottom
                            )
                            Text("Disponer de\nsaldo")         // crea un texto en pantalla
                                                               // el \n es un salto de línea → así se divide en dos renglones

                            .font(.footnote)                   // cambia el tamaño/tipo de letra a “footnote” (pequeño, ideal para etiquetas)
                                                               // ayuda a que el texto no se vea demasiado grande comparado con el círculo

                            .multilineTextAlignment(.center)   // centra el texto cuando tiene varias líneas
                                                               // sin esto, por defecto quedaría alineado a la izquierda

                            .fixedSize(horizontal: false, vertical: true)
                                                               // evita que el texto “colapse” en altura
                                                               // garantiza que siempre ocupe el espacio necesario para todas sus líneas
                                                               // IMPORTANTE: ayuda a que todas las cards del carrusel tengan la misma altura,
                                                               // incluso si unas tienen 1 línea y otras 2

                        }
                        
                       
                    }
                    .padding(.horizontal, 20)                         // Margen lateral de todo el carrusel
                    .padding(.top, 10)                                // Espacio superior respecto a la sección anterior
                }
                
                // === Divider debajo del carrusel ===
                Divider()
                    .frame(height: 0.5)
                    .overlay(Color.white)
                    .padding(.top, 20)   // opcional, deja un poquito de aire arriba
                
                
                //--------TARJETA DE CREDITO---------------
                
                VStack(alignment: .leading, spacing: 8) { // VStack = columna alineada a la izquierda; spacing = separación entre textos
                    
                    HStack(){
                        
                        Text("Tarjeta de crédito")
                            .font(.title3)       // tamaño título pequeño
                            .fontWeight(.semibold) // semibold = semi-negrita
                        
                        Spacer()
                        
                        Image(systemName:"chevron.right")
                    }
                    .padding(.vertical, 14)
                    
                    
                    // fila 2: monto debajo del título
                    
                    Text("Saldo actual")
                    Text("$18.64")
                    
                    HStack{
                        Text("Fecha de corte: 16 SEP ")
                        
                    }.padding(.top, 5)
                    Text("Límite disponible: $7,981.36 ")
            
                }
                .padding(.horizontal, 16) // margen lateral de la franja
                
                // === Divider debajo del carrusel ===
                Divider()
                    .frame(height: 0.5)
                    .overlay(Color.white)
                    .padding(.top, 20)   // opcional, deja un poquito de aire arriba
                
                
                
                
                //----- CARD DE MIS TARJETAS --------
                HStack(spacing: 12) {                           // HStack = fila horizontal
                    Image(systemName: "creditcard.fill")        // ícono de tarjeta
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)           // tamaño del ícono
                    
                    Text("Mis tarjetas")                        // texto de la card
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading) // ← AQUÍ, aplicado al HStack entero
                .padding(16)                                    // relleno interno de la tarjeta
                .background(                                    // fondo de la tarjeta
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.3))
                )
                .padding(.horizontal, 16)                       // margen a los lados
                .padding(.top, 20)                              // separación superior

                // === Divider debajo  ===
                Divider()
                    .frame(height: 0.5)
                    .overlay(Color.white)
                    .padding(.top, 20)   // opcional, deja un poquito de aire arriba
                
                
                VStack(alignment: .leading, spacing: 8){
                    
                    HStack{
                        Text("Préstamo personal")
                            .font(.title2)
                        
                        Spacer() //para mandar el icono  a la derecha
                        
                        Image(systemName: "chevron.right") //icono
                    }
                    
                    Text("Simula y descubre en segundos la oferta que tenemos para ti")
                    
                    
                    
                }.padding(.horizontal, 16) // margen lateral de la franja
                    .padding(.vertical, 15) //para separar del divider
                
                  
                
                VStack(alignment: .leading, spacing: 8){ //para alinear a la izquierda
                    
                    
                        Text("Simular préstamo")
                            .foregroundColor(.white) //color del texto
                            .padding(10) //ancho de la tarjeta
                            .background(
                        RoundedRectangle(cornerRadius: 15) //redondeado
                            .fill(Color(red: 0.379, green: 0.079, blue: 0.601))//color de tarjeta
                    )
                    
                }.frame(maxWidth: .infinity, alignment: .leading) //para alinear a la izquierda
                .padding(.horizontal, 16) // margen lateral de la franja
                
                // === Divider debajo  ===
                Divider()
                    .frame(height: 0.5)
                    .overlay(Color.white)
                    .padding(.top, 20)   // opcional, deja un poquito de aire arriba
                
                
                //----SECCION DESCUBRE MÁS-----
                
                VStack(alignment: .leading, spacing: 8){
                    
                    Text("Descubre más")
                        .font(.title2)
                    
                }.frame(maxWidth: .infinity, alignment: .leading) //para alinear a la izquierda
                .padding(.horizontal, 16) // margen lateral de la franja
                .padding(.top, 20)
                .padding(.bottom,20)
                
                
                
                ScrollView(.horizontal, showsIndicators: false){// ScrollView en horizontal → permite desplazar ítems de lado a lado
                    // showsIndicators: false → oculta la barrita de scroll (se ve más limpio)
                    
                    HStack(alignment: .top, spacing: 24){ // HStack → organiza los ítems en fila
                        // alignment: .top → todos los ítems alineados arriba
                        // spacing: 24 → deja 24 puntos de espacio entre cada ítem
                        
                        
                        //--PRIMER CUADRO-----
       
                        ZStack(alignment: .top) {                 // alineación al tope del card
                            
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color(red: 0.169, green: 0.169, blue: 0.173))                // fondo blanco
                            
                            VStack(spacing: 8) {
                                
                                Image("nubillete")
                                    .resizable() // permite que la imagen pueda cambiar su tamaño (por defecto viene fija)
                                    .scaledToFit() // ajusta la imagen al contenedor manteniendo su proporción (no se deforma)
                                    .cornerRadius(15) //redondea las esquinas de la imagen
                                    .frame(width: .infinity, height: .infinity)
    
                                
                                VStack{
                                    Text("Prueba la billetera de google\u{2122}")
                                        .foregroundColor(.white) //color del texto
                                        .bold() //negritas
                                }
                                
                                Text("Agrega tu tarjeta de manera rápida y segura")
                                    .foregroundColor(.gray) //color del texto
                                
                                
                                
                                    .overlay( //para sobreponer algo sobre una imagen
                                        
                                        Text("Saber más")
                                            .foregroundColor(.white) //color del texto
                                            .padding(9) //ancho de la tarjeta
                                            .background(
                                        RoundedRectangle(cornerRadius: 15) //redondeado
                                            .fill(Color(red: 0.379, green: 0.079, blue: 0.601))//color de tarjeta
                                            ).padding(.top, 100)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                    )
                
                            }
                            
                            
                        }
                        .frame(width: 300, height: 315) //tamaño de la tarjeta
                        .padding(.horizontal, 10) //separar toda la tarjeta del borde
                        
                        
                        //----SEGUNDO CUADRO--------
                        
                        ZStack(alignment: .top) {                 // alineación al tope del card
                            
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color(red: 0.169, green: 0.169, blue: 0.173))                // fondo blanco
                            
                            VStack(spacing: 8) {
                                
                                Image("nubillete")
                                    .resizable() // permite que la imagen pueda cambiar su tamaño (por defecto viene fija)
                                    .scaledToFit() // ajusta la imagen al contenedor manteniendo su proporción (no se deforma)
                                    .cornerRadius(15) //redondea las esquinas de la imagen
                                    .frame(width: .infinity, height: .infinity)
    
                                
                                VStack{
                                    Text("La era Nu se acerca")
                                        .foregroundColor(.white) //color del texto
                                        .bold() //negritas
                                }
                                
                                Text("Invita a alguien a formar parte de Nu")
                                    .foregroundColor(.gray) //color del texto
                                
                                
                                
                                    .overlay( //para sobreponer algo sobre una imagen
                                        
                                        Text("Saber más")
                                            .foregroundColor(.white) //color del texto
                                            .padding(9) //ancho de la tarjeta
                                            .background(
                                        RoundedRectangle(cornerRadius: 15) //redondeado
                                            .fill(Color(red: 0.379, green: 0.079, blue: 0.601))//color de tarjeta
                                            ).padding(.top, 100)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                    )
                
                            }
                            
                            
                        }
                        .frame(width: 300, height: 315) //tamaño de la tarjeta
                        .padding(.horizontal, 10) //separar toda la tarjeta del borde
                        
                        
                        //---TERCER CUADRO-------
                        
                        ZStack(alignment: .top) {                 // alineación al tope del card
                            
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color(red: 0.169, green: 0.169, blue: 0.173))                // fondo blanco
                            
                            VStack(spacing: 8) {
                                
                                Image("nubillete")
                                    .resizable() // permite que la imagen pueda cambiar su tamaño (por defecto viene fija)
                                    .scaledToFit() // ajusta la imagen al contenedor manteniendo su proporción (no se deforma)
                                    .cornerRadius(15) //redondea las esquinas de la imagen
                                    .frame(width: .infinity, height: .infinity)
    
                                
                                VStack{
                                    Text("La era Nu se acerca")
                                        .foregroundColor(.white) //color del texto
                                        .bold() //negritas
                                }
                                
                                Text("Invita a alguien a formar parte de Nu")
                                    .foregroundColor(.gray) //color del texto
                                
                                
                                
                                    .overlay( //para sobreponer algo sobre una imagen
                                        
                                        Text("Saber más")
                                            .foregroundColor(.white) //color del texto
                                            .padding(9) //ancho de la tarjeta
                                            .background(
                                        RoundedRectangle(cornerRadius: 15) //redondeado
                                            .fill(Color(red: 0.379, green: 0.079, blue: 0.601))//color de tarjeta
                                            ).padding(.top, 100)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                    )
                
                            }
                            
                            
                        }
                        .frame(width: 300, height: 315) //tamaño de la tarjeta
                        .padding(.horizontal, 10) //separar toda la tarjeta del borde
            
                        
                    }
                    
                    
                }
                    


                
                
                
                
            }
        }
        // Fondo negro global: asegura que el resto de la pantalla sea negro
        .background(Color.black.ignoresSafeArea())
        
        // Fuerza modo oscuro: todo se ve como en dark mode
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

