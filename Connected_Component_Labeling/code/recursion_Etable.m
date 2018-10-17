function[x]=recursion_Etable(arr,x)
if  arr(x)~=x
    x=arr(x);
    recursion_Etable(arr,x)
end

end
% eg.
% ET=[1,2,2,2,3]
% do the recursion_Etable(ET,5)
% if ET(5)~=5
% then x=ET(5)=3
% then do the recursion_Etable(ET,3)
% if ET(3)~=3
% then x=ET(3)=2
% then do the recursion_Etable(ET,2)
% as ET(2)=2, we won't do the recursion
% the output is 2