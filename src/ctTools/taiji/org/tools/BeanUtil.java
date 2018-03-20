package taiji.org.tools;

import taiji.snappy.web.utils.BeanFactory;

public class BeanUtil {
	public static <T> T getBean(String beanName,Class<T> t){
		return (T)BeanFactory.getBean(beanName);
	}
}
