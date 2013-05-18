package traites.util.beans;

import groovy.util.ConfigObject;
import groovy.util.ConfigSlurper;

import java.io.IOException;
import java.util.Properties;

import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.core.io.Resource;

public class GroovyFactoryBean implements FactoryBean<Properties>, InitializingBean {
	
	private Resource[] locations;
	private boolean singleton = true;
	private Properties singletonInstance;

	
	public final void setSingleton(boolean singleton) {
       this.singleton = singleton;
    }
	

	public void setLocation(Resource location) {
		this.locations =  new Resource[] {location};
	}
	
	public void setLocations(Resource[] locations) {
		this.locations = locations;
	}

	@Override
	public boolean isSingleton() {
		return singleton;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		if (this.singleton) {
          this.singletonInstance = createInstance();
       }
	}

	@Override
	public Properties getObject() throws IOException {
       if (this.singleton) {
            return this.singletonInstance;
       }
       else {
           return createInstance();
       }
	}

	@Override
	public Class getObjectType() {
		return Properties.class;
	}

	protected Properties createInstance() throws IOException{
        return mergeProperties();
    }

	private Properties mergeProperties() throws IOException {
	    ConfigObject configObject = new ConfigObject();  
	    ConfigSlurper configSlurper = new ConfigSlurper();
	    for (Resource l : locations) {  
	      configObject.merge(configSlurper.parse(l.getURL()));  
	    }  
	    return configObject.toProperties();
	}

}
