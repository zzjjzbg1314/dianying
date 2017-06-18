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

import javax.servlet.http.HttpServletRequest;
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
            serviceResult.setData(list);
            serviceResult.setMsg("success");
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
