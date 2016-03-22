package com.bank.annotation;
import org.aspectj.lang.JoinPoint;  
import org.aspectj.lang.annotation.*;  
import org.slf4j.Logger;  
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;  
import org.springframework.web.context.request.RequestContextHolder;  
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSON;
import com.bank.model.log.LogModel;
import com.bank.model.user.UserModel;
import com.bank.service.log.LogService;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpSession;  
import java.lang.reflect.Method;
import java.util.Date;  
  
/** 
 * 切面 
 */  
@Aspect  
@Component  
public class SystemLogAspect {  
     //注入Service用于把日志保存数据库  
     @Autowired
     private LogService logService;  
     //本地异常日志记录对象  
     private  static  final Logger logger = LoggerFactory.getLogger(SystemLogAspect. class);  
  
     //Service层切点  
     @Pointcut("@annotation(com.bank.annotation.SystemServiceLog)")  
     public  void serviceAspect() {}  
  
     //Controller层切点 Before  
     @Pointcut("@annotation(com.bank.annotation.SystemControllerBeforeLog)")  
     public  void controllerBeforeAspect() {}  
     
     //Controller层切点 After  
     @Pointcut("@annotation(com.bank.annotation.SystemControllerAfterLog)")  
     public  void controllerAfterAspect() {} 
  
    /** 
     * 前置通知 用于拦截Controller层记录用户的操作 
     * 
     * @param joinPoint 切点 
     * @throws Exception 
     */  
     @Before("controllerBeforeAspect()")  
     public  void doBefore(JoinPoint joinPoint) throws Exception {  
  
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
        HttpSession session = request.getSession();  
        //读取session中的用户  
        UserModel user = (UserModel) session.getAttribute("user"); 
        //请求的IP  
        String ip = request.getRemoteAddr();  
         try {  
            //*========控制台输出=========*//  
//            System.out.println("=====前置通知开始=====");  
//            System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
//            System.out.println("方法描述:" + getControllerMethodDescription(joinPoint,0));  
//            System.out.println("请求人:" + user.getUser_name());  
//            System.out.println("请求IP:" + ip);  
            //*========数据库日志=========*//  
            LogModel log = new LogModel();  
            log.setLog_msg(getControllerMethodDescription(joinPoint,0));  
            log.setLog_type(1); 
            log.setLog_method((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
            log.setLog_user_id(user.getUser_id());
            log.setLog_user_name(user.getUser_name());;  
            log.setLog_time(new Date());;  
            log.setLog_ip(ip);  
            //保存数据库  
            logService.add(log);  
//            System.out.println("=====前置通知结束=====");  
        }  catch (Exception e) {  
            //记录本地异常日志  
            logger.error("==前置通知异常==");  
            logger.error("异常信息:{}", e.getMessage());  
        }  
    }  
     
     /** 
      * 后置通知 用于拦截Controller层记录用户的操作 
      * 
      * @param joinPoint 切点 
      * @throws Exception 
      */  
      @After("controllerAfterAspect()")  
      public  void doAfter(JoinPoint joinPoint) throws Exception {  
   
         HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
         HttpSession session = request.getSession();  
         //读取session中的用户  
         UserModel user = (UserModel) session.getAttribute("user"); 
         //请求的IP  
         String ip = request.getRemoteAddr();  
          try {  
             //*========控制台输出=========*//  
//             System.out.println("=====后置Controller通知开始=====");  
//             System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
//             System.out.println("方法描述:" + getControllerMethodDescription(joinPoint,1));  
//             System.out.println("请求人:" + user.getUser_name());  
//             System.out.println("请求IP:" + ip);  
             //*========数据库日志=========*//  
             LogModel log = new LogModel();  
             log.setLog_msg(getControllerMethodDescription(joinPoint,1));  
             log.setLog_type(1); 
             log.setLog_method((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
             log.setLog_user_id(user.getUser_id());
             log.setLog_user_name(user.getUser_name());;  
             log.setLog_time(new Date());;  
             log.setLog_ip(ip);  
             //保存数据库  
             logService.add(log);  
//             System.out.println("=====后置Controller通知结束=====");  
         }  catch (Exception e) {  
             //记录本地异常日志  
             logger.error("==后置Controller通知异常==");  
             logger.error("异常信息:{}", e.getMessage());  
         }  
     }  
  
    /** 
     * 异常通知 用于拦截service层记录异常日志 
     * 
     * @param joinPoint 
     * @param e 
     */  
	 @AfterThrowing(pointcut = "serviceAspect()", throwing = "e")  
     public  void doAfterThrowing(JoinPoint joinPoint, Throwable e) {  
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
        HttpSession session = request.getSession();  
        //读取session中的用户  
        UserModel user = (UserModel) session.getAttribute("user");  
        //获取请求ip  
        String ip = request.getRemoteAddr();  
        //获取用户请求方法的参数并序列化为JSON格式字符串  
        String params = "";  
         if (joinPoint.getArgs() !=  null && joinPoint.getArgs().length > 0) {  
             for ( int i = 0; i < joinPoint.getArgs().length; i++) {  
                params += JSON.toJSONString(joinPoint.getArgs()[i]) + ";";  
            }  
        }  
         try {  
              /*========控制台输出=========*/  
//            System.out.println("=====异常通知开始=====");  
//            System.out.println("异常代码:" + e.getClass().getName());  
//            System.out.println("异常信息:" + e.getMessage());  
//            System.out.println("异常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
//            System.out.println("方法描述:" + getServiceMthodDescription(joinPoint));  
//            System.out.println("请求人:" + user.getUser_name());  
//            System.out.println("请求IP:" + ip);  
//            System.out.println("请求参数:" + params);  
               /*==========数据库日志=========*/  
            LogModel log = new LogModel();  
            log.setLog_msg(getServiceMthodDescription(joinPoint));  
            log.setLog_class(e.getClass().getName());  
            log.setLog_type(1); 
            log.setLog_exception_detail(e.getMessage());  
            log.setLog_method((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
            log.setLog_params(params);  
            log.setLog_user_id(user.getUser_id());
            log.setLog_user_name(user.getUser_name());;  
            log.setLog_time(new Date());;  
            log.setLog_ip(ip);  
            //保存数据库  
            logService.add(log);  
//            System.out.println("=====异常通知结束=====");  
        }  catch (Exception ex) {  
            //记录本地异常日志  
            logger.error("==异常通知异常==");  
            logger.error("异常信息:{}", ex.getMessage());  
        }  
         /*==========记录本地异常日志==========*/  
        logger.error("异常方法:{}异常代码:{}异常信息:{}参数:{}", joinPoint.getTarget().getClass().getName() + joinPoint.getSignature().getName(), e.getClass().getName(), e.getMessage(), params);  
  
    }  
  
  
    /** 
     * 获取注解中对方法的描述信息 用于service层注解 
     * 
     * @param joinPoint 切点 
     * @return 方法描述 
     * @throws Exception 
     */  
     public  static String getServiceMthodDescription(JoinPoint joinPoint)  
             throws Exception {  
        String targetName = joinPoint.getTarget().getClass().getName();  
        String methodName = joinPoint.getSignature().getName();  
        Object[] arguments = joinPoint.getArgs();  
        Class targetClass = Class.forName(targetName);  
        Method[] methods = targetClass.getMethods();  
        String description = "";  
         for (Method method : methods) {  
             if (method.getName().equals(methodName)) {  
                Class[] clazzs = method.getParameterTypes();  
                 if (clazzs.length == arguments.length) {  
                    description = method.getAnnotation(SystemServiceLog. class).description();  
                     break;  
                }  
            }  
        }  
         return description;  
    }  
  
    /** 
     * 获取注解中对方法的描述信息 用于Controller层注解 
     * 
     * @param joinPoint 切点 
     * @param state 0 before 1 after
     * @return 方法描述 
     * @throws Exception 
     */  
    public  static String getControllerMethodDescription(JoinPoint joinPoint,int state)  throws Exception {  
        String targetName = joinPoint.getTarget().getClass().getName();  
        String methodName = joinPoint.getSignature().getName();  
        Object[] arguments = joinPoint.getArgs();  
        Class targetClass = Class.forName(targetName);  
        Method[] methods = targetClass.getMethods();  
        String description = "";  
         for (Method method : methods) {  
             if (method.getName().equals(methodName)) {  
                Class[] clazzs = method.getParameterTypes();  
                 if (clazzs.length == arguments.length) {
                	if (state==0) {
                		description = method.getAnnotation(SystemControllerBeforeLog. class).description();  
					}else{
						description = method.getAnnotation(SystemControllerAfterLog. class).description();  
					}
                     break;  
                }  
            }  
        }  
         return description;  
    }  
}  