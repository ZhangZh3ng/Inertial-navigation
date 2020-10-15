function [ imu_err ] = imuerror( condition )
%% **************************************************************
%名称：imu error
%功能：设置imu误差
%________________________________________________________________________
% 输入：
%       condition: 器件类型
% 输出：
%       imu_err: imu器件参数组成的struct,包含：
%            eb: 陀螺零偏
%            web: 角度随机游走
%            db: 加计零偏
%            wdb: 速度随机游走
%_________________________________________________________________________
%作者：哈尔滨工程大学 自动化学院 张峥
%日期：2020年10月15日
% ************************************************************************
%%
gvar_earth;

if exist('condition', 'var')
    switch condition
        % *** 自定义方案 ***
        case 'selfdefine'
            imu_err.case = 'selfdefine';
            imu_err.eb = [0.1, 0.1, 0.1]'*dph;
            imu_err.web = [0.01, 0.01, 0.01]'*dpsh;
            imu_err.db = [800, 900, 1000]'*ug;
            imu_err.wdb = [10, 10, 10]'*ugpsHz;
        
        otherwise
            % *** 默认情况 *** 
            % @捷联惯导算法与组合导航原理 P239 组合导航程序中的器件误差
            imu_err.case = 'default';
            imu_err.eb = [0.01, 0.015, 0.02]'*dph;
            imu_err.web = [0.001, 0.001, 0.001]'*dpsh;
            imu_err.db = [80, 90, 100]'*ug;
            imu_err.wdb = [1, 1, 1]'*ugpsHz;
    end
    
else
    % *** no error ***
    % 如果没有给出condition，则默认imu误差为零 
    imu_err.case = 'zero';
    imu_err.eb = [0, 0, 0]'*dph;
    imu_err.web = [0, 0, 0]'*dpsh;
    imu_err.db = [0, 0, 0]'*ug;
    imu_err.wdb = [0, 0, 0]'*ugpsHz;
    
end

end
