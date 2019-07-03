//package net.onebean.sodium.consumer.mq;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.serializer.SerializerFeature;
//import net.onebean.common.exception.BusinessException;
//import net.onebean.common.model.BaseResponse;
//import ErrorCodesEnum;
//import TenantInfoService;
//import net.onebean.tenant.mngt.api.model.FindTtenantInfoVo;
//import net.onebean.tenant.mngt.api.model.ModifyTtenantInfoStatusReq;
//import net.onebean.tenant.mngt.api.model.TenantInfoStatusEnum;
//import net.onebean.tenant.mngt.api.service.TennantInfoApi;
//import net.onebean.util.StringUtils;
//import com.rabbitmq.client.Channel;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.amqp.core.Message;
//import org.springframework.amqp.rabbit.annotation.RabbitHandler;
//import org.springframework.amqp.rabbit.annotation.RabbitListener;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import java.util.Optional;
//
//@Component
//public class DevopsInitTenantAccountConsumer {
//
//
//    private final static Logger LOGGER = LoggerFactory.getLogger(DevopsInitTenantAccountConsumer.class);
//    @Autowired
//    private TenantInfoService tenantInfoService;
//    @Autowired
//    private TennantInfoApi  tennantInfoApi;
//
//    @RabbitListener(queues = "eakay.devops.tenant.info.init.tenant.account")
//    @RabbitHandler
//    public void process(FindTtenantInfoVo vo, Channel channel, Message message) {
//        LOGGER.info("DevopsInitAccountConsumer process access  text = "+ JSON.toJSONString(vo, SerializerFeature.WriteMapNullValue));
//        try {
//            String tenantId = Optional.ofNullable(vo).map(FindTtenantInfoVo::getId).orElse(null);
//            if (StringUtils.isNotEmpty(tenantId)){
//                tenantInfoService.initTenantInfoTableAndFunctionBySql(tenantId);
//            }else{
//                LOGGER.error("filed id is empty");
//            }
//            ModifyTtenantInfoStatusReq  req = new ModifyTtenantInfoStatusReq();
//            req.setId(tenantId);
//            req.setStatus(TenantInfoStatusEnum.NORMAL.getKey());
//            BaseResponse response = tennantInfoApi.updateStatus(req);
//            String errCode = Optional.ofNullable(response).map(BaseResponse::getErrCode).orElse(null);
//            if (StringUtils.isEmpty(errCode) || !errCode.equals(ErrorCodesEnum.SUSSESS.code())){
//                throw new BusinessException(ErrorCodesEnum.CLOUD_API_RESP_ERR.code(), ErrorCodesEnum.CLOUD_API_RESP_ERR.msg()+" api of tennantInfoApi.update");
//            }
//            channel.basicAck(message.getMessageProperties().getDeliveryTag(),false);
//        } catch (Exception e) {
//            throw new BusinessException(ErrorCodesEnum.RABBIT_MQ_BUSSINES_ERR.code(), ErrorCodesEnum.RABBIT_MQ_BUSSINES_ERR.msg());
//        }
//    }
//}