function [ imu_err ] = imuerror( condition )
%% **************************************************************
%���ƣ�imu error
%���ܣ�����imu���
%________________________________________________________________________
% ���룺
%       condition: ��������
% �����
%       imu_err: imu����������ɵ�struct,������
%            eb: ������ƫ
%            web: �Ƕ��������
%            db: �Ӽ���ƫ
%            wdb: �ٶ��������
%_________________________________________________________________________
%���ߣ����������̴�ѧ �Զ���ѧԺ ���
%���ڣ�2020��10��15��
% ************************************************************************
%%
gvar_earth;

if exist('condition', 'var')
    switch condition
        % *** �Զ��巽�� ***
        case 'selfdefine'
            imu_err.case = 'selfdefine';
            imu_err.eb = [0.1, 0.1, 0.1]'*dph;
            imu_err.web = [0.01, 0.01, 0.01]'*dpsh;
            imu_err.db = [800, 900, 1000]'*ug;
            imu_err.wdb = [10, 10, 10]'*ugpsHz;
        
        otherwise
            % *** Ĭ����� *** 
            % @�����ߵ��㷨����ϵ���ԭ�� P239 ��ϵ��������е��������
            imu_err.case = 'default';
            imu_err.eb = [0.01, 0.015, 0.02]'*dph;
            imu_err.web = [0.001, 0.001, 0.001]'*dpsh;
            imu_err.db = [80, 90, 100]'*ug;
            imu_err.wdb = [1, 1, 1]'*ugpsHz;
    end
    
else
    % *** no error ***
    % ���û�и���condition����Ĭ��imu���Ϊ�� 
    imu_err.case = 'zero';
    imu_err.eb = [0, 0, 0]'*dph;
    imu_err.web = [0, 0, 0]'*dpsh;
    imu_err.db = [0, 0, 0]'*ug;
    imu_err.wdb = [0, 0, 0]'*ugpsHz;
    
end

end
