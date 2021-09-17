\version "2.22.0"
#(set-global-staff-size 16)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Stolen Moments"
composer = #"Oliver Nelson"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"


realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
} }

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  %asplayed = #"Oliver Nelson" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=RbaGDDbpcQ4"
  arranger = \markup \on-the-fly #played?
    \with-url #url
    \with-color #blue \underline
    \concat { "(as played by " \fromproperty #'header:asplayed ")" }
    tagline = ##f
}

\layout {
  \context {
    \Score
     startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
  }
}



theNotes = \relative c'' {
  \key bes \major 
  \time 4/4
  \showStartRepeatBar \bar "[|:"

\repeat volta 2 {
<< 
{ r8 g4.~ g2 | r8 a4.~ a2 | r8 bes4.~ bes2 | r8 a4.~ a2}
\\
{ r8 es4.~ es2 | r8 f4.~ f2 | r8 g4.~ g2 | r8 f4.~ f2}  
>> 
} \break
\A r8 g( bes <g d'>-.) r8 <f c'>4-> bes8 | <g c>( <es a>4 f16 c es8) <d g>4. | 
r8 g( bes<g d'>-.) r8 <f c'>4-> bes8 | <c g>( <es, a>4. <d g>2) | \break
r8 as'( c <as es'> -.) r8 <g d'> 4-> c8 | <as d>( <f bes>4.) <c f>8( <es as>4.) |
r8 es( g <es bes'>-.) r8 <d a'>4-> g8 | <es a>( <d f>4.) <c es>4-- \breathe g'8. bes16 \bar "||" \break
\B 
<<
{ c8es c c ~ c es c c | c es c c ~ c es c c | c es c c ~ c es c c
c es c c, ~ c es c c \break |
c es c c ~ c es c c | c es c c  r8 g' a g | \Coda bes4 a8 g ~ g4. g8 ~ | g1 }
\\ 

{ f4. fis8 ~ fis4. g8 ~
g4. as8 ~ as4. a8 ~ 
a4. as8 ~ as4. g8 ~
g4. r8 r4. f,8
f4. fis8 ~ fis4. g8 ~
g4. r8 r es'8 f es g4 f8 es ~ es4. d8 ~ d1 \bar "|." }
>>
\break \Coda
\repeat volta 3 { << { bes'4 a8 g ~ g4. g8 ~ } \\ 
                     { g4 f8 es ~ es4. d8 ~ } >> }
\alternative { { << { g2 } \\ { d } >> r8 << { g a g } \\ { es8 f es } >> } { << { g2 \repeatTie } \\ { d \repeatTie } >> r8 c -\markup rubato es g | f1 \fermata } }
\bar ".." % \break
% \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
% \mark \markup { \bold \pad-markup #1 "Chorus : blues en Ré mineur"  }
% s1*4 \bar "||" s1*2 \break
% s1*2 \bar "||" s1*4 \bar "|."
}
harmonies = \chordmode {
c1:m7 d:m7/c es:m7+/c d:m7/c
c:m7 c:m6 c:m7 c:m6.9
f:m7 f:m6 c:m7 c:m6
d2:m es:m e:m f:m fis:m f:m e:m es:m
d:m7 es:dim c:7/e f:m c1:m g:7
c:m g:7 g2:7 r f
}



\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } <<
            \new Voice \theNotes
      >> >>
} 
\markup { \bold \pad-markup #1 "Chorus : blues en Do mineur"  }
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
       \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        }
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
            \new Voice  \transpose c d \theNotes
      >> >>} 
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice  \transpose c a \theNotes
      >> >>} 
\markup { \bold \pad-markup #1 "Chorus : blues en La mineur"  }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleFa \consists "Merge_rests_engraver" } <<
            \new Voice  \theNotes
      >> >>
} 
\markup { \bold \pad-markup #1 "Chorus : blues en Do mineur"  }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
           \new Voice  \transpose c d \theNotes
      >> >>
} 
\markup { \bold \pad-markup #1 "Chorus : blues en Ré mineur"  }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice  \transpose c a \theNotes
      >> >>
} 
\markup { \bold \pad-markup #1 "Chorus : blues en La mineur"  }
} }

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
