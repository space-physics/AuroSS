function p = expanduser(p)
arguments
  p (1,1) string
end

if ~startsWith(p, "~")
  return
end

if ispc()
  h = getenv("USERPROFILE");
else
  h = getenv("HOME");
end

p = h + extractAfter(p, 1);

end
