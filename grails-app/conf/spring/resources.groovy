// Place your Spring DSL code here
beans = {
	customPropertyEditorRegistrar(traites.editor.CustomPropertyEditorRegistrar) { 
     messageSource = ref('messageSource') 
    }
	
	customDateEditor(traites.editor.CustomDateEditor) { bean ->
		bean.singleton = false // editors store state so are not thread-safe
	}
	
	namedQueries(org.springframework.beans.factory.config.PropertiesFactoryBean){
		locations = ["classpath:application.properties"]
	}
	
//	groovyNamedQueries(traites.util.beans.GroovyFactoryBean){
//		locations = ["file:./grails-app/conf/hibernate/NamedQueries.groovy"]
//	}
}
