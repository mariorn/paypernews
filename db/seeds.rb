

user1 = User.create(name: 'Mario', last_name: 'Romero', email: 'mario@mario.com', password: '12345678', password_confirmation: '12345678')

user2 = User.create(name: 'Prueba', last_name: 'Probando', email: 'prueba@prueba.com', password: '12345678', password_confirmation: '12345678')

Category.create(name: 'ESPAÑA')
Category.create(name: 'ECONOMÍA')
Category.create(name: 'INTERNACIONAL')
Category.create(name: 'OPINIÓN')
Category.create(name: 'SOCIEDAD')
Category.create(name: 'CULTURA')
Category.create(name: 'DEPORTES')
Category.create(name: 'TECNOLOGÍA')
Category.create(name: 'VIAJES')
Category.create(name: 'LOCALES')
Category.create(name: 'AUTONÓMICAS')
Category.create(name: 'TENDENCIAS')


n1 = Article.new(title: 'El Real Madrid habría propuesto al Chelsea un trueque entre James y Hazard', lead: 'El Real Madrid podría haber propuesto al Chelsea un trueque de cara al próximo mercado estival.', body: 'Los blancos, que ya han filtrado sus dudas sobre James Rodríguez, habrían sondeado a los ingleses la opción de que el colombiano acabase en Stanford Bridge a cambio de que Eden Hazard, uno de los deseados sobre todo por la directiva blanca, acabe en el Santiago Bernabéu.

Según el diario británico "The Sun" ésta sería la propuesta que habría llegado a las oficinas de los "blues" y que también habría sido rechazada por el propio conjunto inglés. En Londres valoran a Hazard, dice el rotativo, en uno 100 millones de euros, más del precio que, afirman, tiene James.

En Madrid no ocultan en los últimos tiempos que el "10" no está al nivel de otras temporadas. Es más, se insiste en señalar que la ausencia de su convocatoria el domingo, ante Las Palmas, podría ser un castigo del nuevo Zidane, una versión mucha más dura del francés.

Sea como fuere, su rendimiento ha bajado tanto o más que el de un Hazard que es silbado por su público (sucedió el pasado miércoles en la Champions League) con un nivel de crítica que su entrenador, Hiddink, reconoce e incluso, afirma, merece esos pitos.

Esa bajada de rendimiento ha hecho que el interés del Real Madrid mengüe al mismo ritmo que aumentan las dudas que genera su incorporación. Sea como sea, los blancos tienen tres meses y medio para decidir qué hacer, si dejar salir a James y, en tal caso, si abrir las puertas de llegada Hazard como su sustituto.', price: 1 , user_id: user1.id)


n2 = Article.new(title: 'Podemos pide que los becarios cobren el salario mínimo y no trabajen más de 6 horas', lead: 'La formación calcula que hay unos 180.000 estudiantes afectados
', body: 'El portavoz de Presupuestos de Podemos en el Congreso, Segundo González, y el diputado morado Miguel Vila han registrado una proposición no de ley para plantear una nueva regulación de los becarios en prácticas que incluya su derecho a cobrar una remuneración equivalente al menos al Salario Mínimo Interprofesional (SMI) y a no trabajar más de seis horas al día.

En la iniciativa, que será debatida en la Comisión parlamentaria de Empleo, Podemos exige suprimir las prácticas no laborales en empresas y las prácticas extracurriculares, a la para que se reforman las que son obligatorias en función del plan de estudios.

En esta nueva regulación se deberían recoger unas "mínimas condiciones laborales" para los estudiantes, que incluyan un límite anual de 500 euros, no superando "en ningún caso" las seis horas diarias; una remuneración obligatoria equivalente al Salario Mínimo y proporcional al número de horas trabajadas, limitar al 5% de la plantilla el número total de becarios permitidos -o a una persona en caso de empresas con menos de diez trabajadores- y garantizar la rotación entre diferentes puestos en prácticas.', price: 1 , user_id: user1.id)


n3 = Article.new(title: 'Cardenal: "Bachelot quedará marcada como una charlatana"', lead: 'El secretario de Estado para el Deporte defendió a Nadal en Radio Marca: "Calumniar a veces es muy barato. Hay gente que se dedica a mentir y no le pasa nada".', body: 'Miguel Cardenal, secretario de Estado para el Deporte, defendió a Rafa Nadal después de las acusaciones de dopaje de la exministra francesa de Deportes Roselyne Bachelot. "Calumniar a veces es un muy barato. Hay gente que se dedica a mentir y no le pasa nada. Es muy distinto que un antiguo responsable de un gobierno se permita un comentario como ese. Es una escalada sin precedentes". Cardenal cargó contra Bachelot: "Es una señora que a veces hace declaraciones desafortunadas en cualquier ámbito. No es el primer día. Es una falacia imposible que sea verdad y creo que Rafa tiene derecho a hacer que pague por ello. Es una persona que quedara marcada como una autentica charlatana", dijo en Radio Marca.

Cardenal, además, se puso a disposición de Rafa Nadal por si necesita ayuda legal en este asunto: "Hemos estado en contacto con el entorno de Rafa ofreciendole la ayuda que quieran". El tenista de Manacor anunció el pasado lunes que no piensa ignorar las acusaciones de Bachelot y que va a demandar. "Estoy cansado de todo. Quiero justicia", dijo Nadal.', price: 1 , user_id: user1.id)


n4 = Article.new(title: 'Zidane mima a Benzema', lead: 'También acudieron a Valdebebas Arbeloa, Varane y Yáñez', body: 'Karim Benzema sigue trabajando para reaparecer en el duelo del Real Madrid ante el Sevilla. El delantero galo acudió a entrenarse en solitario a Valdebebas y trabajó mano a mano con Zidane, con el que tocó balón y realizó ejercicios de cara a portería, una muestra más de la protección que Zizou proporciona a su 9.También acudieron a entrenarse a la Ciudad Real Madrid Arbeloa, Rubén Yáñez y Varane, que trabajó en el interior de las instalaciones.', price: 1 , user_id: user1.id)


n5 = Article.new(title: 'Benzema responde al primer ministro francés', lead: 'Manuel Valls había criticado el posible regreso del madridista a la selección francesa', body: 'Karim Benzema se defiende. El delantero madridista ha respondido con fuerza a las declaraciones del primer ministro francés, Manuel Valls, que había criticado la posibilidad de que el ariete pudiera ser convocado por Deschamps."12 temporadas como profesional, 541 partidos, cero rojas y 11 amarillas... ¿Y algunos discuten mi ejemplaridad?", ha escrito el jugador blanco en su cuenta de Twitter. Karim, una vez levantado el control judicial, espera su regreso al combinado galo, cuya convocatoria se sabrá este jueves.', price: 1 , user_id: user1.id)


n6 = Article.new(title: 'Rita Barberá acepta declarar voluntariamente ante el juez', lead: 'La exalcaldesa de Valencia insiste en que no hay pruebas contra ella y afirma que el levantamiento del secreto de sumario "no ha aportado nada nuevo"', body: 'Ritá Barberá sigue manteniendo su inocencia y para demostrarlo está dispuesta a declarar ante el juez que instruye el presunto blanqueo de dinero en el grupo municipal del PP en el Ayuntamiento de Valencia. "Quiero que sepan todos los valencianos y todos los españoles que agradezco de verdad a su señoría el ofrecimiento que, como no puede ser de otra manera en un Estado de Derecho, acepto. Aprovecho para manifestar rotundamente que colaboraré con la Justicia". 

Barberá ha hecho este anuncio en rueda de prensa un día después de que el titular del juzgado de Instrucción 18 de Valencia le ofreciera esa posibilidad de declarar voluntariamente en la pieza separada que investiga un supuesto blanqueo de capitales en el PP valenciano.', price: 1 , user_id: user1.id)


n7 = Article.new(title: 'Rajoy: "Es un paso adelante muy importante que Barberá atienda la petición del juez"', lead: 'Por su parte, el vicesecretario de Sectorial del PP, Javier Maroto, ha señalado que ve insuficientes las palabras de Barberá: "No me han gustado nada"', body: 'El presidente del Gobierno en funciones, Mariano Rajoy, ha asegurado este martes que es un "paso muy importante" que la exalcaldesa de Valencia y senadora del Grupo Popular, Rita Barberá, haya atendido la petición del juez de declarar voluntariamente en el caso Imelsa y ha recalcado que eso le deja "tranquilo".

Por su parte, el vicesecretario de Sectorial del PP, Javier Maroto, ha considerado "insuficientes" las explicaciones que ha dado hoy en rueda de prensa la exalcaldesa de Valencia. "No me han gustado nada", ha señalado.


"Me parecen insuficientes y creo además que no han solucionado nada, no puedo ser más claro", ha añadido Maroto en declaraciones a los periodistas.

Las palabras de Barberá "no explican nada, no convencen nada y no ayudan nada", ha dicho además el dirigente popular.', price: 1 , user_id: user1.id)


n8 = Article.new(title: 'Una eurodiputada de Podemos, tras leer textos sobre agricultura en el TTIP: “Es lo que esperaba o peor”', lead: '"Si se aprueba este tratado se estará vendiendo nuestro campo y nuestra riqueza al mejor postor", asegura la europarlamentaria Estefanía Torres.', body: 'La eurodiputada de Podemos Estefanía Torres ha visto confirmados sus temores en relación al polémico TTIP, el tratado comercial que la UE y EEUU negocian con sigilo desde 2013: "Confirma lo que esperaba y puede que sea peor incluso", asegura a Público tras haber accedido este mismo martes a la reading room del Parlamento Europeo en Bruselas, una suerte de cámara secreta en la que los europarlamentarios pueden leer parte de los documentos de la negociación. ', price: 1 , user_id: user2.id)


n9 = Article.new(title: 'Iglesias pide a Fernández Díaz que dimita si se demuestra que utilizó a la Policía para atacar a Podemos', lead: 'El líder del partido responde a Interior sobre las carencias del informe PISA reveladas por "Público": "Estamos encantados de que se investigue el famoso informe del que se habla en el que al parecer no hay ninguna firma de ningún profesional de la Policía". ', body: 'El secretario general de Podemos, Pablo Iglesias, se ha mostrado "encantado" de que se investigue si su partido se ha financiado de forma ilegal, como sostiene el ya famoso informe fantasma PISA, pero ha dejado claro que si se demuestra que el ministro del Interior, Jorge Fernández Díaz, ha utilizado a agentes de la Policía para atacar a una formación política debería dimitir.

Iglesias se ha referido al informe que desde Interior se ha filtrado a varios medios de comunicación, que se atribuye a la Unidad de Delincuencia Económica y Fiscal de la Policía (UDEF) y que se ha remitido al Tribunal de Cuentas. En el mismo, del que existe al menos dos versiones, miembros de la unidad de inteligencia pretenden demostrar la supuesta financiación ilegal de la cuarta fuerza política en votos.', price: 1 , user_id: user2.id)


n10 = Article.new(title: 'Breivik se presenta ante un tribunal noruego realizando el saludo nazi', lead: 'El autor de la matanza de Oslo y Utoya (Noruega) en 2011 denuncia que es maltratado en prisión, donde tiene una celda con tres habitaciones, televisión y ordenador.', body: 'El autor de la matanza de Oslo y Utoya (Noruega) en 2011, Anders Behring Breivik, se ha presentado este martes realizando el saludo nazi ante el tribunal que va a analizar la denuncia que ha presentado contra el estado noruego por considerar que vulnera sus derechos fundamentales al mantenerle encarcelado en régimen de aislamiento.

Breivik ha saludado alzando el brazo derecho al estilo nazi cuando ha llegado ante el tribunal en la primera sesión del juicio sobre la demanda con la que pretende que las autoridades noruegas cambien su régimen penitenciario.', price: 1, user_id: user2.id)


n11 = Article.new(title: 'La política argentina, revolucionada por la votación de los fondos buitre', lead: 'Los kirchneristas movilizan ciudadanos y diputados para impedir que Macri supere este martes la primera prueba en el Congreso', body: 'La política argentina vive estas horas en plena revolución ante una votación clave, que marcará el arranque del mandato de Mauricio Macri: la que este martes dará paso o no al pacto definitivo con los fondos buitre. El Gobierno juega contrarreloj: antes del 13 de abril necesita tener aprobadas en el Congreso y el Senado las leyes que desbloquean ese pacto alcanzado en Nueva York. Si no lo logra para entonces, el acuerdo decae y el descrédito internacional de Argentina será muy importante en especial en los mercados financieros, que han acogido la llegada de Macri con gran entusiasmo.

Todo parece indicar que sí lo conseguirá pero antes tiene que superar la primera votación clave, la del Congreso, que dará pasó a otras tantas ya muy orientadas por el resultado de la que está previsto realizar a última hora del martes. El dramatismo habitual de la política argentina se ha concentrado en esta votación que parece marcar un antes y un después y señalar la definitiva ruptura del peronismo, algo que facilitará mucho las cosas a un Macri que está en minoría tanto en el Congreso como en el Senado.', price: 1, user_id: user2.id)


n12 = Article.new(title: 'Un muerto en el centro de Berlín al estallar una bomba en un coche', lead: 'Las primeras informaciones apuntan a un asesinato y no a un atentando terrorista
', body: 'El conductor de un coche ha muerto al estallar presuntamente un artefacto explosivo en el interior del vehículo en el centro de Berlín, según ha informado la policía alemana en Twitter. El estallido se produjo en en el barrio de Charlottenburg, mientras el automóvil, un Volkswagen Passat gris, estaba en marcha. La policía, que ha acordonado la zona, ha descartado tras una revisión que el turismo contuviera otros artefactos explosivos.', price: 1, user_id: user2.id)


n13 = Article.new(title: 'Las primarias llegan a un momento clave en un ambiente de tensión', lead: 'Las propuestas de Trump polarizan la sociedad estadounidense
', body: 'Las primarias para elegir a los candidatos presidenciales de Estados Unidos llegan este martes a un momento decisivo en un ambiente de tensión tras los últimos incidentes en actos de Donald Trump, que el pasado viernes suspendió un mitin en Chicago por el enfrentamiento violento entre sus simpatizantes y varios grupos que protestaban contra el magnate. Los incendiarios pronunciamientos del showman han removido los cimientos de una sociedad que se ha fracturado entre partidarios y detractores de Trump.

Desde que anunció su candidatura y empezó sus ataques contra los inmigrantes, las protestas han acompañado a Trump en todos sus actos. Casi siempre eran grupos de hispanos que censuraban su intención de expulsar del país a los 11 millones de indocumentados y construir un muro en la frontera con México, un país que pone en la diana de sus discursos a diario. En las últimas semanas, a medida que Trump se ha ido consolidando en las primarias y caucus como el candidato que tiene más opciones de conseguir la nominación republicana, la tensión se ha disparado.', price: 1, user_id: user2.id)


n14 = Article.new(title: 'El anuncio de tallas grandes que las cadenas no quieren', lead: 'Las televisiones NBC y ABC no emiten la campaña por "indecente", según ha declarado una de las modelos', body: 'Si las cadenas estadounidenses NBC y ABC emiten los anuncios de ropa interior de Victoria Secret, ¿por qué no hacerlo de campañas publicitarias de mujeres de tallas grandes orgullosas de su cuerpo? La negativa de las cadenas a emitir el anuncio de la marca Lane Bryant ha hecho saltar la polémica después de que, según la web TMZ, estas rechazaran las imágenes por "indecentes".

En la campaña This Body – en español, Este cuerpo–, las modelos posan en ropa interior, hacen deporte o dan el pecho. "Este cuerpo está hecho para empezar una revolución", dice una de las protagonistas. Pero la campaña no ha logrado convencer a las cadenas, según ha declarado a la revista TMZ la modelo Ashley Graham –que acaba de convertirse en la primera de talla grande en posar en la portada de la revista Sport\'s Illustrated–.', price: 1, user_id: user2.id)


user1.articles << n1
user1.articles << n2
user1.articles << n3
user1.articles << n4
user1.articles << n5
user1.articles << n6
user1.articles << n7
user2.articles << n8
user2.articles << n9
user2.articles << n10
user2.articles << n11
user2.articles << n12
user2.articles << n13
user2.articles << n14



# FAKER GEM!!!

