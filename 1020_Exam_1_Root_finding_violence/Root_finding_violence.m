% Compute the roots of function 'sinx' in [-L,L]
function Root_finding_violence(L)
    % input L: a real number
    %
    % example:
    % > Root_finding_violence(6*pi)
    %
    x = linspace(-abs(L), abs(L), 10^4);        % ����x�b��10^4���I
    n = 0;                                      % ���ڪ��ƶq(��l��)
    find_roots = [];                            % �کҦb�϶��������I(��l����)
    % �}�l��ڪ��϶�
    for ii = 1:(10^4-1)
       % ��[x0,x1]���i���i�঳��
       x0 = x(ii);                        
       x1 = x(ii+1);
       a = f(x0);
       b = f(x1);
       if (a*b < 0)               % �ɮڪk�Gsin(x0)*sin(x1) ��� [x0,x1] ������
           n = n + 1;                         % ��s�ڪ��ƶq
           find_roots = [find_roots; x0 x1];  % �x�s���ڪ��϶�
       end    
    end

    tol = 10^(-5);                       % �]�w�e�\��
    roots = [];                          % �s�U�ڪ���(��l����)
    % �ɤO�D��
    % �b��쪺�϶����H�����I�A�p��e�\�ȴN��������
    for k = 1:n
        a = find_roots(k,1);               % �϶������I
        b = find_roots(k,2);               % �϶��k���I
        jj = 0;                            % ��l�M�䦸��
        difference = 100;                  % ��l�e��V���t
        % �}�l��ڡA�p��e�\�ȴN���X
        while difference > tol
            x = (b-a)*rand(1) + a;         % �b�϶�[a,b]���H�����I
            y = f(x);                   % ����
            difference = abs(y);          % �p��P0���t
            jj = jj+1;
            if(jj>10^8)                        % �]�w���榸��
                disp('****WARNING****')        % ��ܥ�ĵ�θ��榸��
                disp(['Stop!! Too many iterations(10^8 times). ', 'Have not found limit yet.'])
                break
            end
        end
        roots(k) = x;                   % �x�s��쪺��
    end
    % ��ܧ�쪺��
    disp('roots = ');
    disp(roots');
    
    function y = f(x)
        y = x*sin(x);
    end
end