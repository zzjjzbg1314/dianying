package com.gaofen.dianying.web.controller;

import com.gaofen.dianying.beans.MovieDetailInfo;
import com.gaofen.dianying.beans.MovieQureyParam;
import com.gaofen.dianying.common.NewServiceResult;
import com.gaofen.dianying.enums.FilmTypeEnum;
import com.gaofen.dianying.persistents.entity.TDbMovie;
import com.gaofen.dianying.persistents.entity.TDbMovieWithBLOBs;
import com.gaofen.dianying.service.MovieServcie;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

/**
 * Created by zongjie on 2017/5/2.
 */
@Controller
@RequestMapping("/")

public class MovieController {

    private Logger LOG = LoggerFactory.getLogger(MovieController.class);

    @Autowired
    private MovieServcie movieServcie;


    @RequestMapping(value = "startPlayMovie", method = RequestMethod.GET)
    public ModelAndView filter(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        /*String url ="http://115.com/?ct=play&pickcode=bxp1cny3id8em8lvc";
        //String url = "https://pan.baidu.com/api/streaming?path=%2Fresources%2Fbt%2Fjinganglang3%2Fjinganglang3.mp4&app_id=250528&clienttype=0&type=M3U8_FLV_264_480&t=0.09996464848518372";
        String cookie = "FP_UID=cf8dace2545cb4fa9b0c232181a21637; panlogin_animate_showed=1; __cfduid=d316bda6c197564eaeaeacf5123729b3f1495350804; PANWEB=1; bdshare_firstime=1495359363812; secu=1; BAIDUID=AE67488375250F04A21E8EDF8EF68B62:FG=1; PSTM=1495637050; BIDUPSID=A5FE2A9DF8375858E972436F46CB261E; BDCLND=5IbCMwmZJkNNQr3JyRU1YbnWTUmGfs941HBay1Ad0lg%3D; recommendTime=guanjia2017-06-22%2018%3A45%3A13; FP_LASTTIME=1498324507014; BDUSS=R0MnFPdVdKNjJ2MUpZN0w4Z2tHcjhUTHRIfnh5ck5Ja2FwT0NhcDN-RDdOSFpaSVFBQUFBJCQAAAAAAAAAAAEAAADop018ytyyu8HLwctkZmQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPunTln7p05ZeW; pan_login_way=1; STOKEN=e6b0c5d6e96104cacc1659fef5315227e809b515d969c8b10b1df3755cb0f594; SCRC=c3221abd924626b7aba1755367bb9649; PSINO=5; BDORZ=B490B5EBF6F3CD402E515D22BCDA1598; H_PS_PSSID=1464_21110_17001_21929_20929; Hm_lvt_7a3960b6f067eb0085b7f96ff5e660b0=1498237360,1498247432,1498326982,1498327958; Hm_lpvt_7a3960b6f067eb0085b7f96ff5e660b0=1498366363; PANPSC=8856837742593624060%3AcQu3KcN2CPfe3TAIPhxVuen90oj%2BY%2FIs3udjOa6aw0awjBqU3m2byirZeuBmT7h0sh0Xo9iU4O2DOi2vRG4L0VtvQpEV7GZLpXGhmIhy50zeC2aLH2G6gpUVfv2qH2vmZUIaRd%2BI0eR4%2B2HacCA3yTsuktMw6gul9%2BxskcZWf5fwpJOoa8Y1Gx%2BX0hKQWqSc1HhjTJuT8WCwcc33C7HckA%3D%3D";
        String getReturnStr = HttpClientUtil.sendGetRequestWithCokie(url, "utf-8", cookie);
        modelAndView.addObject("tsfile", getReturnStr);
        modelAndView.addObject("movieUrl",url);
        modelAndView.addObject("cookie",cookie);
        response.setContentType("text/plain;charset=UTF-8");
        response.reset();
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Cookie",cookie);
        LOG.error(getReturnStr);*/
        modelAndView.setViewName("movie/playmovie");
        return modelAndView;
    }


    @RequestMapping(value = "queryall", method = RequestMethod.GET)
    @ResponseBody
    public NewServiceResult queryAllMovie(HttpServletRequest request) {
        NewServiceResult serviceResult = new NewServiceResult();
        try{
            List<TDbMovieWithBLOBs> list =movieServcie.queryAllMovies();

            for(TDbMovie movie :list){
                for(FilmTypeEnum e :FilmTypeEnum.values()){
                    if(Integer.parseInt(movie.getType()) == e.getCode()){
                        movie.setType(e.getDesc());
                        break;
                    }
                }
            }
            serviceResult.setCode(200);
            serviceResult.setMsg("success");
            serviceResult.setData(list);
        }catch (Exception e ){
            LOG.error("queryall movie failed!"+e.getMessage());
            serviceResult.setCode(500);
            serviceResult.setData(null);
            serviceResult.setMsg("failed!");

        }
        return serviceResult;
    }

    @RequestMapping(value = "queryMoviesByType", method = RequestMethod.POST)
    @ResponseBody
    public NewServiceResult queryMoviesByType(HttpServletRequest request, @RequestBody MovieQureyParam param) {
        NewServiceResult serviceResult = new NewServiceResult();
        try{
            if(CollectionUtils.isNotEmpty(param.getTypeListStrs()) ){
                HashMap<String,Object> returnMap = new HashMap<String,Object> ();
                    for(String strType:param.getTypeListStrs()){
                        List<TDbMovieWithBLOBs> list  =movieServcie.queryMoviesByType(strType);

                        for(TDbMovie movie :list){
                            for(FilmTypeEnum e :FilmTypeEnum.values()){
                                if(Integer.parseInt(movie.getType()) == e.getCode()){
                                    movie.setType(e.getDesc());
                                    break;
                                }
                            }
                        }

                        if(StringUtils.isNotEmpty(param.getWelcomeFlag()) && param.getWelcomeFlag().equals("YES") && list.size()>8){
                            returnMap.put(strType,list.subList(0,8));
                        }
                    }
                serviceResult.setCode(200);
                serviceResult.setMsg("success");
                serviceResult.setData(returnMap);


            }else{
                if(param.getTypeStr() == null || param.getTypeStr().length() <1){
                    LOG.error("type is null!");
                    throw new RuntimeException("movieId is null!");
                }

                List<TDbMovieWithBLOBs> list  =movieServcie.queryMoviesByType(param.getTypeStr());

                for(TDbMovie movie :list){
                    for(FilmTypeEnum e :FilmTypeEnum.values()){
                        if(Integer.parseInt(movie.getType()) == e.getCode()){
                            movie.setType(e.getDesc());
                            break;
                        }
                    }
                }
                serviceResult.setCode(200);
                if(StringUtils.isNotEmpty(param.getWelcomeFlag()) && param.getWelcomeFlag().equals("YES") && list.size()>8){
                    serviceResult.setData(list.subList(0,8));
                }else {
                    serviceResult.setData(list);
                }
                serviceResult.setMsg("success");
            }
        }catch (Exception e ){
            LOG.error("queryMoviesByType failed!"+e.getMessage());
            serviceResult.setCode(500);
            serviceResult.setData(null);
            serviceResult.setMsg("failed!");

        }
        return serviceResult;
    }


    @RequestMapping(value = "queryMovieDetailInfoByMovieId", method = RequestMethod.POST)
    @ResponseBody
    public NewServiceResult queryMovieDetailInfoByMovieId(HttpServletRequest request, @RequestBody MovieQureyParam param) {
        NewServiceResult serviceResult = new NewServiceResult();
        try{
            if(param.getMovieId() == null){
                LOG.error("movieId is null!");
                throw new RuntimeException("movieId is null!");
            }
            MovieDetailInfo movieDetailInfo  =movieServcie.queryMovieDetailInfoByMovieId(param.getMovieId());
            for(FilmTypeEnum e :FilmTypeEnum.values()){
                if(Integer.parseInt(movieDetailInfo.gettMovie().getType()) == e.getCode()){
                    String desc =e.getDesc();
                    movieDetailInfo.gettMovie().setType(desc);
                    break;
                }
            }
            serviceResult.setCode(200);
            serviceResult.setMsg("success");
            serviceResult.setData(movieDetailInfo);
        }catch (Exception e ){
            LOG.error("queryMovieDetailInfoByMovieId failed!"+e.getMessage());
            serviceResult.setCode(500);
            serviceResult.setData(null);
            serviceResult.setMsg("failed!");
        }
        return serviceResult;
    }

    @RequestMapping(value = "sendBdyMsg", method = RequestMethod.POST)
    @ResponseBody
    public NewServiceResult sendBdyMsg(HttpServletRequest request, @RequestBody MovieQureyParam param) {
        NewServiceResult serviceResult = new NewServiceResult();
        try{
            LOG.info("movieId->"+param.getMovieId());
            LOG.info("form_id->"+param.getForm_id());
            LOG.info("uuid->"+param.getUuid());

            if(param.getMovieId() == null){
                LOG.error("movieId is null!");
                throw new RuntimeException("movieId is null!");
            }
            if(param.getForm_id() == null || StringUtils.isEmpty(param.getForm_id())){
                LOG.error("form_id null!");
                throw new RuntimeException("form_id is null!");
            }
            if(param.getUuid() == null || StringUtils.isEmpty(param.getUuid())){
                LOG.error("uuid null!");
                throw new RuntimeException("uuid is null!");
            }
            movieServcie.sendBdyMsg(param.getMovieId(),param.getUuid(),param.getForm_id());
            serviceResult.setCode(200);
            serviceResult.setMsg("success");
        }catch (Exception e ){
            LOG.error("queryMovieDetailInfoByMovieId failed!"+e.getMessage());
            serviceResult.setCode(500);
            serviceResult.setMsg("failed!");
            serviceResult.setData(null);
        }
        return serviceResult;
    }

    @RequestMapping(value = "queryByMovieIdS", method = RequestMethod.POST)
    @ResponseBody
    public NewServiceResult queryByMovieIdS(HttpServletRequest request, @RequestBody MovieQureyParam param) {
        NewServiceResult serviceResult = new NewServiceResult();
        try{
            LOG.info("movieIds->"+param.getMovieIds());

            if(CollectionUtils.isEmpty(param.getMovieIds())){
                LOG.error("movieIds is null!");
                throw new RuntimeException("movieIds is null!");
            }
            List<TDbMovieWithBLOBs> movies =movieServcie.queryByMovieIds(param.getMovieIds());
            serviceResult.setCode(200);
            serviceResult.setMsg("success");
            serviceResult.setData(movies);
        }catch (Exception e ){
            LOG.error("queryByMovieIdS failed!"+e.getMessage());
            serviceResult.setCode(500);
            serviceResult.setMsg("failed!");
            serviceResult.setData(null);
        }
        return serviceResult;
    }



}
